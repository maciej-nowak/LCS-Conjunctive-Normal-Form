# LCS-Conjunctive-Normal-Form
Converting formula into CNF using rules. Created at the University as the project within Logic in Computer Science classes in 2016. The purpose of this project was to learn converting formulas into CNF based on Prolog's rules.

## Program
Program allows to convert typed formula into CNF based on rules (notation as belowed examples).

### Examples
cnf(~ (p and q)=>q=>r,_G1372)  
X = (p or ~q or r)and q or ~q or r.  
  
cnf((p=>q)and p=>q,_G1372)  
X = ((p or ~p)or q)and (~q or ~p)or q.  
  
cnf((a and b)or (c and d)or e,_G1372)  
X = ((a or c or e)and a or d or e)and (b or c or e)and b or d or e.
