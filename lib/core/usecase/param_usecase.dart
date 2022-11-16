abstract class ParamUseCase<Type, Param> {
  Future<Type> execute(Param param);
}
