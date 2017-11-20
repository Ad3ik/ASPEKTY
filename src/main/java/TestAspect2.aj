public aspect TestAspect2 {
    declare parents: TestAsp implements MyAccess;
    private long MyAccess.lastExecuteTime;

    pointcut checkSetTEST() : execution (* *.Set*(..));

    before() : checkSetTEST() {
        throw new RuntimeException("NIE MOszzzzNA... I JUŻ !");
    }

    pointcut timeChecker() : execution(public * *.*(..)) && !execution( * *.Set*(..))
            && !execution(* *.Get*(..));

    Object around() : timeChecker() {
        long time = System.nanoTime();
        Object ret = proceed();
        System.out.println("Czas wykonania tego to jest : " + (System.nanoTime()-time));
        return ret;
    }

    public void MyAccess.updateLastExecuteTime() {
        lastExecuteTime = System.currentTimeMillis();
    }

    public long MyAccess.getLastExecuteTime() {
        return lastExecuteTime;
    }

    before(MyAccess myAccess)
            : execution(* MyAccess+.*(..))
            && !execution(* MyAccess.*(..))
            && this(myAccess) {
        myAccess.updateLastExecuteTime();
    }

}
interface MyAccess {


}
