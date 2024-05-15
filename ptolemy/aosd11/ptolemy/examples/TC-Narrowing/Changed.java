import edu.iastate.cs.ptolemy.runtime.VoidEventType;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;
//
class Changed extends VoidEventType{
	Fig fe;
	
	public void contract(){
		Contract.requires(fe != null); // precondition of handlers
		Contract.ensures( fe != null); // postcondition of handlers
		
		if(fe.fixed)
			invoke(next);
		else
			Contract.requiresEnsures(Contract.requires(true), Contract.ensures(fe==Contract.oldValue(fe)));
	}
}

