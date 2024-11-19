extension ExtensionFunctions on bool {
  get invert => !this;
  get clear => false;
}

extension ExtensionFunctionsNull on bool? {
  get invert => this == true ? false : true;
  get clear => null;
}
