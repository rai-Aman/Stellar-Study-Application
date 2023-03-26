//Email Validation
String? validateEmail(String? email) {
  if (email == null || email.isEmpty) {
    return 'Please enter your email';
  }

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  if (!emailRegex.hasMatch(email)) {
    return 'Please enter a valid email address';
  }

  final domain = email.split('@')[1];
  final validDomains = [
    'gmail.com',
    'yahoo.com',
    'hotmail.com'
  ]; // valid domain for validation
  if (!validDomains.contains(domain)) {
    return 'Invalid email domain';
  }
  return null;
}

//Function for checking password and confirm password

String? validatePassword(String? value, String? confirmPassword) {
  if (value == null || value.isEmpty) {
    return 'Please enter your password';
  }
  if (confirmPassword != null && confirmPassword != value) {
    return 'Passwords do not match';
  }
  if (value.length < 8) {
    return 'Password should be at least 8 characters long';
  }
  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Password should contain at least one uppercase letter';
  }
  if (!RegExp(r'[a-z]').hasMatch(value)) {
    return 'Password should contain at least one lowercase letter';
  }
  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Password should contain at least one digit';
  }
  return null;
}
