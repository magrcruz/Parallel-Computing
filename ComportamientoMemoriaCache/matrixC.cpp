#include <iostream>
#include <vector>
#include <random>
#include <chrono>

using namespace std;

void fill_matrix(vector<vector<int>> &matrix, int n)
{
    unsigned seed = 1234;
    std::mt19937 gen(seed);

    uniform_int_distribution <> dist(0,1);

    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < n; ++j) {
            matrix[i][j] = dist(gen);
        }
    }
}

void multiply(vector<vector<int>> A, vector<vector<int>> B,vector<vector<int>> &C, int n) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < n; j++) {
            for (int k = 0; k < n; k++) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
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
    vector<vector<int>> C(n,vector<int>(n,0));

    fill_matrix(A,n);
    fill_matrix(B,n);


    auto start = std::chrono::high_resolution_clock::now();
    
    // Multiplicación de matrices
    multiply(A, B,C,n);
    
    auto end = std::chrono::high_resolution_clock::now();
    auto duration = std::chrono::duration_cast<std::chrono::microseconds>(end - start);
    
    std::cout << n << " " << duration.count() << std::endl;
        
    return 0;
}

