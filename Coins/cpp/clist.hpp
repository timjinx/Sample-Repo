#include <iostream>
#include <vector>
#include "coin.hpp"
#include <string>
using namespace std;
using std::vector;
class Clist {
    private:
       vector<Coin*> coins;
    public:
       Clist(int v_size);
       string toString(void);
       void flipCoins(void);
       int countHeads(void);
};
Clist::Clist(int v_size) {
    int i = 0;
    coins.clear();
    while ( i < v_size) {
       Coin* c = new Coin;
       coins.push_back(c);
       i++;
    }
};
void Clist::flipCoins(void) {
    int i = 0;
    while ( i < coins.size()) {
        coins.at(i++)->flip();
    } 
}
int Clist::countHeads(void) {
    int i = 0;
    int heads = 0;
    while ( i < coins.size()) {
        if ( coins.at(i++)->getValue() == 0 ) {
            heads++;
        }
    }
    return heads;
}
string Clist::toString(void) {
    int i = 0;
    string oput ("Values:");
    while ( i < coins.size()) {
        oput = oput + coins.at(i++)->toString() + ":";
    } 
    return oput;
}