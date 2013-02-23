﻿// Use Cholesky factorization
IMPORT ML;
IMPORT ML.Types AS Types;
IMPORT Std.Str ;
IMPORT ML.mat as Mat;
NumericField := Types.NumericField;

EXPORT Regress_OLS_2_Sp(DATASET(NumericField) X,DATASET(NumericField) Y)
:= MODULE(ML.Regress_OLS_Sp(X,Y))
  // Use Cholesky factorization
  mL := Mat.Decomp.Cholesky(Mat.Mul(mXt, mX));
  fsub := Mat.Decomp.f_sub(mL,Mat.Mul(mXt, mY));
  SHARED DATASET(Mat.Types.Element) mBetas := Mat.Decomp.b_sub(Mat.Trans(mL), fsub);
END;
