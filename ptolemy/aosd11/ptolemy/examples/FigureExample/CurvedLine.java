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
public class CurvedLine extends Line {

	public CurvedLine(Point p1, Point p2, Point cp1, Point cp2)
	{
		super(p1, p2);
		this.cp1 = cp1;
		this.cp2 = cp2;
	}

	Point cp1, cp2;

	public void moveBy(int dx, int dy){

	}
}

