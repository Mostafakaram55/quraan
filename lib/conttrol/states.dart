abstract class ShopState{}
class InitialState extends ShopState{}
class LoadingState extends ShopState{}
class SuccessState extends ShopState{}
class ErrorState extends ShopState{
  final error;

  ErrorState(this.error);
}

class SuccessChangesabhaState extends ShopState{}
class zerooChangesabhaState extends ShopState{}
class SephaChangesabhaState extends ShopState{}



class LoadingHidesState extends ShopState{}
class SuccessHidesState extends ShopState{}
class ErrorHidesState extends ShopState{
  final error;

  ErrorHidesState(this.error);
}

class SuccessPlusFontSizeState extends ShopState{}
class SuccessMinusFontSizeState extends ShopState{}


class createdatabaseState extends ShopState{}
class insertdatabaseState extends ShopState{}
class getdatabaseState extends ShopState{
}
class getdatabaseLoadingState extends ShopState{
}

class SuccessimageState extends ShopState{}


class deletdatabaseState extends ShopState{
}

class SuccessAzkarState extends ShopState{}


class LoadingweatherState extends ShopState{}
class SuccessweatherState extends ShopState{}
class ErrorweatherState extends ShopState{
  final error;

  ErrorweatherState(this.error);
}


class ChangeColorState extends ShopState{}


class LoadingaladhanState extends ShopState{}
class SuccessaladhanState extends ShopState{}
class ErroraladhanState extends ShopState{
  final error;

  ErroraladhanState(this.error);
}