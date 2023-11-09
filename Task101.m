  A = input("Enter the Matrix A: ");
  B = input("Enter the Matrix B: ");


  Max_Element_A = max(max(A));
  fprintf("Max Value of A: %d  \n",Max_Element_A) ;
  Row_No = rows(B);
  Col_No = columns(A) ;
  if Row_No == Col_No
    Final_Matrix = A*B ;
    fprintf("The result is :\n");
    disp(Final_Matrix);
  else
    fprintf("Matrix multiplication is not possible.\n");
  end


