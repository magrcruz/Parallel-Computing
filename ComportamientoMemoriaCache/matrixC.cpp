#include <iostream>
#include <vector>
#include <random>
#include <chrono>

using namespace std;

void fill_matrix(vector<vector<int>> &matrix, int n)
{
    unsigned seed = 1234;
    std::mt19937 gen(seed);

    uniform_int_distribution <> dist(-100,100);

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            matrix[i][j] = dist(gen);
        }
    }
}

vector<vector<int>> matrixMultiplication(vector<vector<int>> A, vector<vector<int>> B) {
    int n = A.size();
    vector<vector<int>> C(n, vector<int>(n));

    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            int sum = 0;
            for (int k = 0; k < n; k++) {
                sum += A[i][k] * B[k][j];
            }
            C[i][j] = sum;
        }
    }

    return C;
}
void printMatrix(vector<vector<int>> C, int n ){
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            cout << C[i][j] << " ";
        }
        cout << endl;
    }

}


int main(int argc, char* argv[]) {
    int n = stoi(argv[1]);

    // Matrices de ejemplo
    vector<vector<int>> A(n,vector<int>(n,0));
    vector<vector<int>> B(n,vector<int>(n,0));
    fill_matrix(A,n);
    fill_matrix(B,n);


    auto start = std::chrono::high_resolution_clock::now();
    
    // Multiplicación de matrices
    vector<vector<int>> C = matrixMultiplication(A, B);
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << n << duration.count() << std::endl;
    
    //printMatrix(C,n);
    
    return 0;
}

