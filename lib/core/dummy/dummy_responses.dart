import 'package:cliniq/core/api/end_points.dart';

class DummyResponses {
  static dynamic getResponse(String path) {
    switch (path) {
      case EndPoints.login:
        return {
          "success": true,
          "message": "Login successful",
          "data": {
            "token": "dummy_access_token_123",
            "refreshToken": "dummy_refresh_token_456",
            "user": {
              "id": 1,
              "name": "Mohamed Ahmed",
              "email": "test@test.com",
              "role": "customer",
            },
          },
        };

      case EndPoints.getMe:
        return {
          "success": true,
          "data": {
            "id": 1,
            "name": "Mohamed Ahmed",
            "email": "test@test.com",
            "role": "customer",
          },
        };

      case EndPoints.userSignUp:
      case EndPoints.doctorSignUp:
        return {
          "success": true,
          "message": "Account created successfully",
          "data": {"email": "test@test.com"},
        };

      case EndPoints.verifyEmail:
      case EndPoints.resendVerifyEmail:
        return {"success": true, "message": "Verification email sent"};

      case EndPoints.forgetPassword:
      case EndPoints.resendResetCode:
        return {"success": true, "message": "Reset code sent"};

      case EndPoints.verifyResetCode:
        return {"success": true, "message": "Code verified"};

      case EndPoints.resetPassword:
        return {"success": true, "message": "Password reset successfully"};

      case EndPoints.logOut:
        return {"success": true, "message": "Logged out"};

      case EndPoints.specializations:
        return {
          "success": true,
          "message": "Specializations fetched successfully",
          "data": [
            {
              "id": "1",
              "name": "Cardiology",
              "image":
                  "https://img.freepik.com/free-vector/heart-attack-concept-illustration_114360-1014.jpg",
            },
            {
              "id": "2",
              "name": "Dermatology",
              "image":
                  "https://img.freepik.com/free-vector/skin-layer-diagram-medical-educational-poster_1308-59648.jpg",
            },
            {
              "id": "3",
              "name": "Neurology",
              "image":
                  "https://img.freepik.com/free-vector/brain-anatomy-concept-illustration_114360-1049.jpg",
            },
          ],
        };

      case EndPoints.suggestedDoctors:
        return {
          "success": true,
          "message": "Doctors fetched successfully",
          "data": [
            {
              "id": "1",
              "name": "Dr. Mohamed Ahmed",
              "image":
                  "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
              "speciality": "Cardiology",
              "experience": "10 years",
              "rating": "4.5",
              "numberOfAppointments": "100",
              "city": "Cairo",
            },
            {
              "id": "2",
              "name": "Dr. Ahmed Mohamed",
              "image":
                  "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
              "speciality": "Dermatology",
              "experience": "5 years",
              "rating": "4.0",
              "numberOfAppointments": "50",
              "city": "Alexandria",
            },
          ],
        };

      case EndPoints.news:
        return {
          "success": true,
          "message": "News fetched successfully",
          "data": [
            {
              "id": "1",
              "title": "New COVID-19 Variant",
              "image":
                  "https://img.freepik.com/free-vector/virus-strain-model-novel-coronavirus-2019-ncov-covid-19-wuhan-china-vector_53876-85750.jpg",
              "description": "A new variant of COVID-19 has been discovered.",
            },
            {
              "id": "2",
              "title": "Healthy Eating Habits",
              "image":
                  "https://img.freepik.com/free-photo/flat-lay-health-still-life-with-copy-space_23-2148854031.jpg",
              "description": "Tips for maintaining a healthy diet.",
            },
          ],
        };

      case EndPoints.examinationAppointments:
        return {
          "success": true,
          "message": "Appointments fetched successfully",
          "data": [
            {
              "id": "1",
              "doctorName": "Dr. Mohamed Ahmed",
              "doctorSpeciality": "Cardiology",
              "doctorImage":
                  "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
              "appointmentDate": "2023-10-25",
              "appointmentTime": "10:00 AM",
              "appointmentStatus": "Upcoming",
            },
            {
              "id": "2",
              "doctorName": "Dr. Ahmed Mohamed",
              "doctorSpeciality": "Dermatology",
              "doctorImage":
                  "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
              "appointmentDate": "2023-10-26",
              "appointmentTime": "11:00 AM",
              "appointmentStatus": "Completed",
            },
          ],
        };

      case EndPoints.availableDoctors:
        return {
          "success": true,
          "message": "Available doctors fetched successfully",
          "data": [
            {
              "id": "1",
              "doctorName": "Dr. Sarah Johnson",
              "doctorSpeciality": "Pediatrician",
              "doctorImage":
                  "https://img.freepik.com/free-photo/woman-doctor-wearing-lab-coat-with-stethoscope-isolated_1303-29791.jpg",
              "appointmentDate": "2023-10-25",
              "appointmentTime": "10:30 AM",
              "appointmentStatus": "Available",
            },
            {
              "id": "2",
              "doctorName": "Dr. Mohamed Ahmed",
              "doctorSpeciality": "Cardiology",
              "doctorImage":
                  "https://img.freepik.com/free-photo/doctor-with-his-arms-crossed-white-background_1368-5790.jpg",
              "appointmentDate": "2023-10-25",
              "appointmentTime": "11:00 AM",
              "appointmentStatus": "Available",
            },
            {
              "id": "3",
              "doctorName": "Dr. Emily Davis",
              "doctorSpeciality": "Dermatology",
              "doctorImage":
                  "https://img.freepik.com/free-photo/portrait-successful-mid-adult-doctor-with-crossed-arms_1262-12865.jpg",
              "appointmentDate": "2023-10-25",
              "appointmentTime": "11:30 AM",
              "appointmentStatus": "Available",
            },
          ],
        };

      default:
        return {
          "success": false,
          "message": "No dummy response for this endpoint",
        };
    }
  }
}
