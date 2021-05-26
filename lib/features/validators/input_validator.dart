String? validateTextFields(String? value) {
  if (value == null || value.isEmpty) return 'Esse campo deve ser preenchido';
  return null;
}
