class ContactModal {
  final String fullName;
  final String email;

  const ContactModal({this.fullName, this.email});

  ContactModal.fromJSON(Map<String, dynamic> jsonMap) :
        fullName = jsonMap['title'],
        email = jsonMap['body'];

}
