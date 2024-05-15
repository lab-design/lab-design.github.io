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

public class Line implements FigureElement {
	Point p1;
	Point p2;

	public Line(Point p1, Point p2) { 
		this.p1 = p1; this.p2 = p2; 
	}

	public Point getP1() { return p1; }
	public Point getP2() { return p2; }
	public void setP1(Point p) { this.p1 = p; }
	public void setP2(Point p) { this.p2 = p; } 

	public void draw() {
		System.out.println("Line between ");
		p1.draw();
		System.out.println(" and ");
		p2.draw();
	}
	public void moveBy(int dx, int dy){
		System.out.println("Before event FEChanged in Line.moveBy");
		     
		announce FEChanged(this) {	
			System.out.println("    Inside event FEChanged's body in Line.moveBy");
			p1.moveBy(dx, dy);
			p2.moveBy(dx, dy);
		}
		System.out.println("After event FEChanged in Line.moveBy");
	}
}
