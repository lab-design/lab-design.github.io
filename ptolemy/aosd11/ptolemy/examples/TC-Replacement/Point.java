import edu.iastate.cs.ptolemy.runtime.diagnostics.Contract;

public class Point{
	int x=0;
	
	void setX(int x){
		announce Changed(this){
			System.out.println("[Announce, Start]");
			this.x = x;
			System.out.println("[Announce, End]");
		}
	}
}