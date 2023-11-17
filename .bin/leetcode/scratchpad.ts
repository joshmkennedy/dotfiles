const lookbehinds = ['V',"L","D","M","C","X"];
function romanToInt(s: string): number {
    let value = 0;
    let i = s.length - 1 
    while(i>=0){
        let cur = s[i]
        const int = NUMERALS[cur]
        value+= int
        if(lookbehinds.includes(cur)){
            const base = int / 10
            while(s[i - 1] == 'I' && i>=0){
                value -= base
                i--
            }
        }
    }
    return value;
};
const NUMERALS = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000,
}
