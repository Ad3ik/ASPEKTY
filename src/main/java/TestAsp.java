public class TestAsp {

    private String testMessage;

    public void SetMessage(String test){

        this.testMessage=test;
    }

    public String GetMessage(){

        return this.testMessage;
    }
    public void SetTest(String test){

        System.out.println(test);
    }

    public void Aditopala(){

        System.out.println("To jest jakaś tam wiadomość i tyle mam do powiedzenia ... ");
    }
}
