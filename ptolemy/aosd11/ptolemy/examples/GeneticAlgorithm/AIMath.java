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
import java.util.Random;

public final class AIMath {
	public static Random rand = new Random(System.currentTimeMillis());

	public static int getRandomInt(int max) {
		return (int) (getRandomFloat() * (max + 1));
	}

	public static final int chooseItem(float[] list) {
		float probs[] = normalize(list);
		float p = getRandomFloat();
		int i;
		for (i = 0; (i < probs.length) && (p > probs[i]); i++)
			p -= probs[i];
		if (i >= probs.length)
			i = probs.length - 1;
		return i;
	}

	public static final int chooseItem(int[] list) {
		float probs[] = normalize(list);
		float p = getRandomFloat();
		int i;
		for (i = 0; (i < probs.length) && (p > probs[i]); i++)
			p -= probs[i];
		if (i >= probs.length)
			i = probs.length - 1;
		return i;
	}

	public static final float[] normalize(float[] vec) {
		return scale(vec, 1 / summation(vec));
	}

	public static final float[] normalize(int[] vec) {
		return scale(vec, 1 / (float) summation(vec));
	}

	public static final float summation(float[] vec) {
		float sum = 0;
		for (int i = 0; i < vec.length; i++)
			sum += vec[i];
		return sum;
	}

	public static final int summation(int[] vec) {
		int sum = 0;
		for (int i = 0; i < vec.length; i++)
			sum += vec[i];
		return sum;
	}

	public static float average(float[] vec) {
		return summation(vec) / (vec.length);
	}

	public static int average(int[] vec) {
		return (int) Math.rint(summation(vec) / (double) vec.length);
	}

	public static float[] scale(float[] vec, float scalar) {
		float ret[] = new float[vec.length];
		for (int i = 0; i < vec.length; i++)
			ret[i] = vec[i] * scalar;
		return ret;
	}

	public static float[] scale(int[] vec, float scalar) {
		float ret[] = new float[vec.length];
		for (int i = 0; i < vec.length; i++)
			ret[i] = vec[i] * scalar;
		return ret;
	}

	public static int[] scale(int[] vec, int scalar) {
		int ret[] = new int[vec.length];
		for (int i = 0; i < vec.length; i++)
			ret[i] = vec[i] * scalar;
		return ret;
	}

	public static float getRandomFloat() {
		return (float) rand.nextDouble();
	}

	public static float minimum(float[] vec) {
		if (vec.length != 0) {
			float min = vec[0];
			for (int i = 0; i < vec.length; i++)
				if (vec[i] < min)
					min = vec[i];
			return min;
		}
		return 0;
	}

	public static int minimum(int[] vec) {
		if (vec.length != 0) {
			int min = vec[0];
			for (int i = 0; i < vec.length; i++)
				if (vec[i] < min)
					min = vec[i];
			return min;
		}
		return 0;
	}

	public static float maximum(float[] vec) {
		if (vec.length != 0) {
			float max = vec[0];
			for (int i = 0; i < vec.length; i++)
				if (vec[i] > max)
					max = vec[i];
			return max;
		}
		return 0;
	}

	public static int maximum(int[] vec) {
		if (vec.length != 0) {
			int max = vec[0];
			for (int i = 0; i < vec.length; i++)
				if (vec[i] > max)
					max = vec[i];
			return max;
		}
		return 0;
	}

	public static int indexOfMinimum(float[] vec) {
		float prev = vec[0];
		int index = 0;
		for (int i = 1; i < vec.length; i++) {
			if (prev < vec[i]) {
				prev = vec[i];
				index = i;
			}
		}
		return index;
	}

	public static int indexOfMinimum(int[] vec) {
		int prev = vec[0];
		int index = 0;
		for (int i = 1; i < vec.length; i++) {
			if (prev < vec[i]) {
				prev = vec[i];
				index = i;
			}
		}
		return index;
	}

	public static int indexOfMaximum(float[] vec) {
		float prev = vec[0];
		int index = 0;
		for (int i = 1; i < vec.length; i++) {
			if (prev > vec[i]) {
				prev = vec[i];
				index = i;
			}
		}
		return index;
	}

	public static int indexOfMaximum(int[] vec) {
		int prev = vec[0];
		int index = 0;
		for (int i = 1; i < vec.length; i++) {
			if (prev > vec[i]) {
				prev = vec[i];
				index = i;
			}
		}
		return index;
	}

}
