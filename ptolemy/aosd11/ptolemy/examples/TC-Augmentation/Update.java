import edu.iastate.cs.ptolemy.runtime.Register;
import edu.iastate.cs.ptolemy.runtime.When;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;

public class Update {
	@Register
	public Update() {}
	
	@When(Changed.class)
	public void handleMe(Changed next) {
		invoke(next);
		Display.update();
	}
}
