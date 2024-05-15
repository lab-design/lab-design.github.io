import edu.iastate.cs.ptolemy.runtime.Register;
import edu.iastate.cs.ptolemy.runtime.When;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;

public class Log {
	@Register
	public Log() {}
	
	@When(Changed.class)
	public void handleMe(Changed next) {
		Display.update(next.fe);
	}
}
