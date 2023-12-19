const String login = r'''
  mutation Login($email: String!, $password: String!) {
    action: login(input: {email: $email, password: $password})
  }
''';