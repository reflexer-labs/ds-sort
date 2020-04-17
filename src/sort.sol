pragma solidity ^0.5.15;

/**
 * @title Quicksort library in Solidity
 * @author Subhod I (https://gist.github.com/subhodi/b3b86cc13ad2636420963e692a4d896f)
 */
library Sort {
    function sort(uint[] storage arr, int left, int right) internal {
        int i = left;
        int j = right;
        if(i==j) return;
        uint pivot = arr[uint(left + (right - left) / 2)];
        while (i <= j) {
            while (arr[uint(i)] < pivot) i++;
            while (pivot < arr[uint(j)]) j--;
            if (i <= j) {
                (arr[uint(i)], arr[uint(j)]) = (arr[uint(j)], arr[uint(i)]);
                i++;
                j--;
            }
        }
        if (left < j)
            sort(arr, left, j);
        if (i < right)
            sort(arr, i, right);
    }
}
