/*
 * This file is part of the Ptolemy project at Iowa State University.
 *
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.mozilla.org/MPL/.
 *
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License
 * for the specific language governing rights and limitations under the
 * License.
 * 
 * For more details and the latest version of this code please see
 * http://www.cs.iastate.edu/~ptolemy/
 *
 * Contributor(s):
 */

public class Point implements FigureElement {
	int x;
	int y;
	public Point(int x, int y) { this.x = x; this.y = y; }
	public int getX() { return x; }
	public int getY() { return y; }
	public void setX(int newX) {
		
		announce FEChanged(this) {
			x = newX;
		}
	}
	public void setY(int newY) {
		 
		announce FEChanged(this) {
			y = newY;
		}
	}

	public void draw(){ 
		System.out.println("Point (" + this.x + "," +   
				this.y + ")");	
	}

	public void moveBy(int dx, int dy){
		System.out.println("Before event FEChanged in Point.moveBy");
		     
		announce FEChanged(this) {	
			System.out.println("    Inside event FEChanged's body in Point.moveBy");
			x += dx;
			y += dy;
		}
		
		System.out.println("After event FEChanged in Point.moveBy");
	}

	public void makeEqual(Point other) {
		
		announce FEChanged(this) {
			other.x = x;
			other.y = y;
		}
	}
}
