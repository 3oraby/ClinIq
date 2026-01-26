import 'package:flutter/material.dart';

class ExpandablePageView extends StatefulWidget {
  final List<Widget> children;
  final PageController? controller;
  final ScrollPhysics? physics;
  final ValueChanged<int>? onPageChanged;
  final Duration animationDuration;
  final Curve animationCurve;

  const ExpandablePageView({
    super.key,
    required this.children,
    this.controller,
    this.physics,
    this.onPageChanged,
    this.animationDuration = const Duration(milliseconds: 300),
    this.animationCurve = Curves.easeIn,
  });

  @override
  State<ExpandablePageView> createState() => _ExpandablePageViewState();
}

class _ExpandablePageViewState extends State<ExpandablePageView> {
  late PageController _pageController;
  late List<double> _heights;
  int _currentPage = 0;

  double get _currentHeight => _heights[_currentPage];

  @override
  void initState() {
    super.initState();
    _heights = List.filled(widget.children.length, 0.0);
    _pageController = widget.controller ?? PageController();
    _pageController.addListener(_updatePage);

    // If controller is provided, we need to sync initial page
    if (widget.controller?.hasClients == true) {
      _currentPage = widget.controller?.initialPage ?? 0;
    }
  }

  @override
  void dispose() {
    _pageController.removeListener(_updatePage);
    if (widget.controller == null) {
      _pageController.dispose();
    }
    super.dispose();
  }

  void _updatePage() {
    final newPage = _pageController.page?.round() ?? 0;
    if (_currentPage != newPage) {
      setState(() {
        _currentPage = newPage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      curve: widget.animationCurve,
      duration: widget.animationDuration,
      tween: Tween<double>(begin: _heights[0], end: _currentHeight),
      builder: (context, value, child) => SizedBox(height: value, child: child),
      child: PageView(
        controller: _pageController,
        physics: widget.physics,
        onPageChanged: widget.onPageChanged,
        children: _sizeReportingChildren
            .asMap() //
            .map((index, child) => MapEntry(index, child))
            .values
            .toList(),
      ),
    );
  }

  List<Widget> get _sizeReportingChildren => widget.children
      .asMap() //
      .map(
        (index, child) => MapEntry(
          index,
          OverflowBox(
            //needed, so that parent won't impose its constraints on the children, thus skewing the measurement results.
            minHeight: 0,
            maxHeight: double.infinity,
            alignment: Alignment.topCenter,
            child: SizeReportingWidget(
              onSizeChange: (size) =>
                  setState(() => _heights[index] = size.height),
              child: child,
            ),
          ),
        ),
      )
      .values
      .toList();
}

class SizeReportingWidget extends StatefulWidget {
  final Widget child;
  final ValueChanged<Size> onSizeChange;

  const SizeReportingWidget({
    super.key,
    required this.child,
    required this.onSizeChange,
  });

  @override
  State<SizeReportingWidget> createState() => _SizeReportingWidgetState();
}

class _SizeReportingWidgetState extends State<SizeReportingWidget> {
  Size? _oldSize;

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void postFrameCallback(_) {
    if (!mounted) return;
    final size = context.size;
    if (_oldSize != size && size != null) {
      _oldSize = size;
      widget.onSizeChange(size);
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(postFrameCallback);
  }

  @override
  void didUpdateWidget(covariant SizeReportingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    WidgetsBinding.instance.addPostFrameCallback(postFrameCallback);
  }
}
