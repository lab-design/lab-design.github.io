import edu.iastate.cs.ptolemy.runtime.VoidEventType;
import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;
//
class Changed extends VoidEventType{
	Fig fe;
	
	public void contract(){
		Contract.requires(fe != null); //Precondition of handlers
		Contract.ensures( fe != null); //Postcondition of handlers
		
		invoke(next);
		Contract.requiresEnsures(Contract.requires(true), Contract.ensures(fe==Contract.oldValue(fe)));
	}
}

