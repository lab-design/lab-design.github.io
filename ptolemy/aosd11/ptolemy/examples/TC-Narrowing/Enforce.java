import edu.iastate.cs.ptolemy.runtime.Register;
import edu.iastate.cs.ptolemy.runtime.When;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;

public class Enforce {
	@Register
	public Enforce() {}
	
	@When(Changed.class)
	public void check(Changed next) {
		if(next.fe.fixed)
			;//invoke(next);
		else
			System.out.println("[Handler: Figure Element Isn't Fixed]");
	}
}
