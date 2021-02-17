import edu.iastate.cs.ptolemy.runtime.VoidEventType;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;
//
class Changed extends VoidEventType{
	Point fe;
	
	public void contract(){
		Contract.requires(fe !=null);
		Contract.ensures(fe !=null);
		
		Contract.requiresEnsures(Contract.requires(true), Contract.ensures(fe==Contract.oldValue(fe)));
	}
	
	
}

