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
          "https://www.google.com/url?sa=i&url=https%3A%2F%2Fdepositphotos.com%2Fstock-photos%2Fletter-k.html&psig=AOvVaw2cXixTdG0ynK0o4YLcUs2R&ust=1642482365644000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLiF2-aBuPUCFQAAAAAdAAAAABAD"});
}
