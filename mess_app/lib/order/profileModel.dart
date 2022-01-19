class ProfileModel {
  final String profile_id;
  final String profile_name;
  final String profile_email;
  final String profile_rollNo;
  String profile_url;

  ProfileModel(
      {this.profile_name = "Kamal",
      this.profile_email = "kamal@iitgn.ac.in",
      this.profile_id = '1',
      this.profile_rollNo = "20110089",
      this.profile_url =
          "https://akm-img-a-in.tosshub.com/indiatoday/images/story/202103/photo-1511367461989-f85a21fda1_0_1200x768.jpeg?YVCV8xj2CmtZldc_tJAkykymqxE3fxNf&size=770:433"});
}
