#!/usr/local/bin/apl --script

 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝
⍝
⍝ Editor 2015-02-19 07:07:11 (GMT-6)
⍝
 ⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝⍝

∇z←l E∆ r
 z←l
∇

∇E∆Add;ln;q;Pad;s                                                 
 Pad←''                                                           
 →(0=1↑⍴Mat)/EN5                                                  
 EN1:→(E∆EHN ln←E∆CS E∆PI'Add or replace which line?  ')/0,HP1,0  
 →(('l'=1↑ln)∨'L'=1↑ln)/EN5                                       
 →((0,(1↑⍴Mat),0.1 0 1)E∆Lck ln)/EN1                              
 ln←⍎ln                                                           
 EN2:→((ln≠⌈ln),ln=0)/EN6,LP1                                     
 E∆O(6↑'[',(⍕ln-1),']'),Mat[ln;]                                  
 LP1:→(0=⍴q←E∆Eoi 6↑'[',(⍕ln),']')/END                            
 →((1↓⍴Mat)=s←(⍴q)⌈1↓⍴Mat)/EN3                                    
 Mat←((1↑⍴Mat),s)↑Mat                                             
 EN3:→(ln≥1↑⍴Mat)/EN4                                             
 Mat[ln←ln+1;]←s↑q                                                
 →LP1                                                             
 EN4:Mat←Mat⍪s↑q                                                  
 ln←ln+1                                                          
 →LP1                                                             
 EN5:ln←''⍴⍴Mat                                                   
 →EN2                                                             
 EN6:E∆Ail ln                                                     
 END:Mat←E∆RS Mat                                                 
 →0                                                               
 HP1:'Enter ''last'' to add lines to the bottom of the function.' 
 'Enter a number between two existing lines to insert a new line.'
 'Enter an existing line number to replace that line.'            
 →EN1                                                             
∇

∇E∆Ail ln;s;q
 →(0=ln←⌈ln)/LP1                    
 E∆O(6↑'[',(⍕ln-1),']'),Mat[ln;]    
 LP1:→(0=⍴q←E∆Eoi 6↑'[',(⍕ln),']')/0
 →((1↓⍴Mat)=s←(⍴q)⌈1↓⍴Mat)/EN1      
 Mat←((1↑⍴Mat),s)↑Mat               
 EN1:Mat←((1+ln)≠⍳1+1↑⍴Mat)⍀Mat     
 Mat[ln+1;]←s↑q                     
 ln←ln+1                            
 →LP1                               
∇

∇z←n E∆CJ x
 z←((0⌈⌊0.5×n-⍴x)⍴' '),x←(¯1+(x≠' ')⍳1)↓(-((⌽x≠' ')⍳1)-1)↓x
∇

∇z←E∆CS x
 z←(¯1+(' '≠x)⍳1)↓(1-(' '≠⌽x)⍳1)↓x
∇

∇E∆Change;L;s;q
 →(0=1↑⍴Mat)/ER1
 EN1:→(E∆EHN L←(1 ¯1,¯1+⍳1↑⍴Mat)E∆Piv'Enter the line numbers you wish to change')/0,EN1,0
 LP1:→(0=⍴L)/END
 q←E∆EditLine Mat[1+''⍴L;]
 →((1↓⍴Mat)=s←(⍴q)⌈1↓⍴Mat)/EN2
 Mat←((1↑⍴Mat),s)↑Mat
 EN2:Mat[1+1↑L;]←s↑q
 L←1↓L
 →LP1
 END:Mat←E∆RS Mat
 →0
 ER1: E∆ER'There are no lines to change.'
∇

∇E∆Clear
 ⍞←(⎕UCS 27),'[2J'
 ⍞←(⎕UCS 27),'[1;1H'
∇

∇E∆Copy;m;fl;tl                                                                    
 →(0=1↑⍴m←Mat)/ER1                                                                 
 EN1:→(E∆EHN fl←(0,(¯1+1↑⍴m),1 0 10000)E∆Pin'Enter the from line numbers')/0,HP1,0 
 EN2:→(E∆EHN tl←(0,(¯1+1↑⍴Mat),0.1 0 1)E∆Pin'Enter the to line number')/EN1,HP2,EN1
 EN4:Mat←(~(⍳(⍴fl)+1↑⍴Mat)∊(tl←⌈tl+.01)+⍳⍴fl)⍀Mat                                  
 Mat[tl+⍳⍴fl;]←m[fl+1;]                                                            
 E∆O'The transfer is complete.'                                                    
 →0                                                                                
 HP1:'Enter the line numbers you wish to copy from.'                               
 →EN1                                                                              
 HP2:'Enter the line number after which the new lines will appear.'                
 'or enter a number between two existing lines to insert at that point.'           
 →EN2                                                                              
 ER1:E∆ER'There are no lines to move.'                                             
∇

∇z←m E∆Ctit t
 m←(((1↑⍴m)×⌈(1↑⍴t←','E∆Parse t)÷+/'B'≠m[;1]),1↓⍴m)⍴m←','E∆Parse m
 z←''
 LP1:→(0=⍴t)/0
 ⍎('B'=m[1;1])/'z←z,(⍎1↓m[1;])⍴'' '''
 ⍎('L'=m[1;1])/'z←z,(⍎1↓m[1;])↑t[1;]'
 ⍎('R'=m[1;1])/'z←z,(-⍎1↓m[1;])↑E∆CS t[1;]'
 ⍎('C'=m[1;1])/'z←z,(⍎1↓m[1;])↑(⍎1↓m[1;])E∆CJ t[1;]'
 ⍎('B'≠m[1;1])/'t←1 0↓t'
 m←1 0↓m
 →LP1
∇

∇z←n E∆DIV d
 z←(n×z)÷d+~z←d≠0
∇

∇E∆Delete;L
 →(0=1↑⍴Mat)/ER1                                                                          
 EN1:→(E∆EHN L←(0,(¯1+1↑⍴Mat),1 0 100)E∆Pin'Enter the line numbers to be deleted')/0,EN1,0
 Mat←(~(⍳1↑⍴Mat)∊L+1)⌿Mat                                                                 
 E∆O'Line numbers ',(,⍕L),' have been deleted.'                                           
 →0                                                                                       
 ER1:E∆ER 'There are no lines to delete.'                                                 
∇

∇z←E∆EHN v
 z←((2 8↑2 4⍴'end help')∧.=8↑v),0=⍴v←,v
∇

∇z←E∆ER p
 ⎕←⎕AV[8],'***  ',p,'  ***'
 z←0 0⍴0
 →(0=⍴Cms)/0
 z←E∆ER 'Error in command string; returning to manual input.',Cms←''
∇

∇z←E∆Ealn t;i;n;q
 q←'abcdefghijklmnopqrstuvwxyz∆ABCDEFGHIJKLMNOPQRSTUVWXYZ⍙0123456789'
 t←((t[;1]≠'⍝')+(t[;1]∊¯10↓q)∧0=(+/∧\t≠':')-+/∧\t∊q)⌽' ',' ',t
 z←((⍴n)⍴(,(-+/∧\⌽i)⌽i)\(,i←n≠' ')/,n←'[',(⍕(n,1)⍴(⍳n←1↑⍴t)-⎕IO),']'),' ',t
 ⍝ t = ⎕CR of a function
 ⍝ z = t with line numbers in brackets added
∇

∇E∆Edit fun;Mat;qq;fn;bv;orig;Cms;Pad;Delim;⎕IO;⎕PW                                 
 ⎕PW←200                                                                            
 ⎕IO←1                                                                              
 Delim←,'∵'                                                                         
 Cms←''                                                                             
 Pad←'  '                                                                           
 →(0≠⍴,fun)/EN0                                                                     
 Mat←0 0⍴''                                                                         
 →EN5                                                                               
 EN0:→(0=1↑⍴Mat←⎕CR fun)/ER1                                                        
 EN5:orig←Mat                                                                       
 ' '                                                                                
 'At all prompts you can type ''end'' to exit or backup to the previous question.'  
 'You can often type ''help'' to get help.'                                         
 ' '                                                                                
 qq←   'add       =  to add; insert; or write over a line,'                         
 qq←qq,'edit      =  to modify an existing line,'                                   
 qq←qq,'delete    =  to delete a group of lines,'                                   
 qq←qq,'move      =  to move lines from one place to another,'
 qq←qq,'copy      =  to copy lines from one place to another,'                      
 qq←qq,'find      =  to find a character string,'
 qq←qq,'replace   =  to search and replace a character string,'                     
 qq←qq,'screen    =  to search and list your function a screen at a time,'          
 qq←qq,'list      =  to scroll the contents of your function on your screen,'       
 qq←qq,'new       =  to erase the entire function,'                                 
 qq←qq,'save      =  save function definition,'                                     
 qq←qq,'original  =  revert back to original definition,'
 qq←qq,'get       =  get a different function to edit'
 qq←','E∆Parse qq                                                                   
 fn←'E∆Add,E∆Change,E∆Delete,E∆Move,E∆Copy,E∆Find,E∆Replace,E∆Screen,E∆List,E∆New,E∆Save,E∆Revert,E∆Get'
 fn←','E∆Parse fn                                                                   
 EN1:→(2↑bv←qq E∆Pim'Enter your edit command')/END,EN1                              
 ⍎,(2↓bv)⌿fn                                                                        
 →EN1                                                                               
 END:→(∨/(⍴Mat)≠⍴orig)/EN4                                                          
 →(∧/∧/Mat=orig)/0                                                                  
 EN4:→('yn'E∆Pis'Function has been modified; leave anyway')/(3⍴EN4),0,EN1           
 EN2:→(0∊⍴Mat)/EN3                                                                  
 →('yn'E∆Pis'Do you wish to return to your original text')/(3⍴EN2),0,EN3            
 EN3: →0                                                                            
 ER1:E∆ER'Function ',fun,' does not exist.'                                         
∇

∇z←E∆EditLine x;p;t;r;s;n;b
 z←E∆CS x                                                         
 p←0                                                              
 LP1:⎕←z                                                          
 →(E∆EHN E∆CS t←,⍞,0⍴⍞←p⍴' ')/END,HP,0                            
 →((1↑E∆CS t)∊',/')/EN1                                           
 →(~(t← E∆CS t)∊' 0123456789')/EN0                                
 p←0⌈¯1+⎕PW⌊⍎(t≠' ')/t                                            
 →LP1                                                             
 EN0:p←0⌈¯1+(p≤⍴z)×p←(∧/(¯1+⍳⍴,t)⊖z∘.=t)⍳1                        
 →LP1                                                             
 EN1:p←0                                                          
 z←('/'≠(⍴z)↑(t⍳',')↑t)/z                                         
 →((','∊t)∧0=s←⍴r←(t⍳',')↓t←((t≠'/')∨~∧\','≠t)/t)/EN2             
 z←((n⍴1),((s+b-n)⍴0),((⍴z)-n←(⍴z)⌊b←¯1+t⍳',')⍴1)\z               
 z[((','∊t)×¯1+t⍳',')+⍳s]←r                                       
 →LP1                                                             
 EN2:z←E∆RS z,(⍴z)↓⍞,0⍴⍞←z                                        
 →0                                                               
 END:z←E∆RS x                                                     
 →0                                                               
 HP:''                                                            
 'Enter  /  under characters you wish to delete.'                 
 'Enter  ,  under the character you wish to insert before.'       
 'Enter text you wish to insert after the first ,'                
 'Enter ''end'' to leave without changing the line.'              
 'Enter an empty ''Enter'' to leave the edit.'                    
 'Enter a number to tab out to a column.'                         
 'Enter text not preceded by , to tab to that text.'
 'Enter , not followed by anything to add to the end of the line.'
 ''                                                               
 →LP1                                                             
∇

∇z←E∆Eoi p
 EN0:z←((⍴Pad)+⍴p)↓⍞,0⍴⍞←p,Pad
 →(':'≠1↑z)/0
 z←1↓z
 ⍎(∧/' '=z)/'→0,0⍴z←''  '''
 →('t'≠1↑z)/EN1
 →((0,PW,1 0 1)E∆Lck 3↑1↓z)/EN0
 z←((⍎3↑1↓z)↑' '),LJ 3↓z
 →0
 EN1:→('c'≠1↑z)/0
 z←⎕PW E∆CJ 1↓z
∇

∇E∆Erase;t                            
 t←⎕EX ((((1↑⍴t),2)↑t)∧.='E∆')⌿t←⎕NL 3
∇

∇E∆Find;s;f                                            
 EN1:→(E∆EHN s←E∆PI'Enter the string to find:')/0,EN1,0
 2 1⍴' '                                               
 →(0=⍴f←(Mat E∆SS s)[;1])/EN2                          
 (E∆Ealn Mat)[((⍳1↑⍴Mat)∊f)/⍳1↑⍴Mat;]                  
 2 1⍴' '                                               
 →0                                                    
 EN2:E∆ER 'Text not found.'                            
 2 1⍴' '                                               
∇

∇E∆Get;f;m                                                       
 →(∨/(⍴Mat)≠⍴orig)/EN1                                           
 →(∧/∧/Mat=orig)/EN2                                             
 EN1:E∆ER'Current function has been changed but not saved.'      
 EN2:→(E∆EHN f←E∆PI'Enter name of new function to edit:')/0,EN2,0
 →(0=1↑⍴m←⎕CR f)/ER1                                             
 Mat←orig←m                                                      
 →0                                                              
 ER1:→EN2 E∆ E∆ER'Function ',f,' does not exist.'                
∇

∇t E∆LP d;i;j;g;a;z;L;x;f;n;c
 n←0
 i←-g←21-1↑⍴t←E∆RS t
 c←⌈/(1↓⍴t),1↓⍴d
 j←1↑⍴d←E∆RS d
 →(x←(80>1↓⍴t)∧80>1↓⍴d)/EN1
 f←c↑,5 0⍕5×⍳c
 f[E∆Omega f=' ']←'-'
 i←-g←¯1+g
 →EN1
 LP1:E∆Clear
 ⍎(~x)/'79↑n↓f'
 ((1↑⍴t),79)↑(0,n)↓t
 (g,79)↑(i,n)↓d
 ' '
 EN1:→(E∆EHN a←E∆CS E∆PI '<><> Screen number ',(⍕1 E∆RND 1+i E∆DIV g),' <><> ')/EN10,HP,EN3
 →('bf.+;el-s'=1↑a)/EN4,EN5,EN7,EN9,EN8,0,EN6,EN11,EN12
 →((1,(⌈j E∆DIV g),0.01 0 1)E∆Lck a)/EN1
 i←(j-1)⌊(⌊100×a-⌊a)+g×¯1+⌊a←⍎a
 →LP1
 HP:E∆Clear
 E∆LPH
 →EN1
 EN3:⍎(j>i+g)/'i←i+g'
 →LP1
 EN4:i←0⌈i-g
 →LP1
 EN5:→LP1 E∆ i←0
 EN6:→LP1 E∆ i←0⌈j-g
 EN7:→((1,j,1 0 1)E∆Lck 1↓a)/EN1
 →LP1 E∆ i←¯1+⍎1↓a
 EN8:→((1,c,1 0 1)E∆Lck 1↓a)/EN1
 →LP1 E∆ n←¯1+⍎1↓a
 EN9:→(0=⍴L←,0 ¯1↓d E∆SS 1↓a)/ER1
 →LP1 E∆ i←¯1+1↑(¯1+(L>1+i)⍳1)⌽L
 EN10:⍝ E∆Clear
 →0
 EN11:→(0=⍴L←,0 ¯1↓d E∆SS 1↓a)/ER1
 →LP1 E∆ i←¯1+¯1↑(¯1+(L>i)⍳1)⌽L
 EN12:→(0=⍴L←,0 ¯1↓d E∆SS 1↓a)/ER1
 t E∆LP d[L;]
 →LP1
 ER1:→EN1 E∆ E∆ER(1↓a),' does not exist.'
∇

∇z←E∆LPH;m
 m←'R20,L59'
 ''
 m E∆Ctit'F, = advance to the first screen and display it'
 ''
 m E∆Ctit'L, = advance to the last screen and display it'
 ''
 m E∆Ctit'B, = backstep one screen an display it'
 ''
 m E∆Ctit'E, = exit the local report mode'
 ''
 m E∆Ctit'END, = exit the local report mode and clear the screen'
 ''
 m E∆Ctit'A number, = advance to the screen number entered'
 m E∆Ctit'A.B, = advance to screen A - line B'
 m E∆Ctit'.number, = advance to the line number entered'
 ''
 m E∆Ctit';number, = advance to the column number entered'
 m E∆Ctit'stext, = display all lines with text'
 m E∆Ctit'+text, = advance to the text entered'
 m E∆Ctit'-text, = scan backward and display from text'
 ''
∇

∇r←v E∆Lck n
 →(0=1↑0⍴n)/EN0
 →(r←(¯1↑(' '≠n)/n←,n)∊' ,')/EN1
 n[E∆Omega','=n]←' '
 n[E∆Omega'-'=n]←'¯'
 →(r←~∧/E∆VI n)/EN1
 n←⍎n
 EN0: →(r←((⌊/n)<1↑v)∨v[2]<⌈/n)/EN2
 →(r←(v[3]≠0)∧∨/(⌊r)≠⌈r←n÷(v[3]=0)+v[3])/EN3
 →(~r←(v[4]>⍴,n)∨v[5]<⍴,n)/0
 →0 E∆ E∆ER 'Error: You must enter ',(⍕v[4]),' to ',(⍕v[5]),' numbers; Re-enter.'
 EN1:→0 E∆ E∆ER n,' is not numeric; Please re-enter.'
 EN2:→0 E∆ E∆ER (⍕n),' is out of range; re-enter from ',(⍕1↑v),' to ',(⍕v[2]),'.'
 EN3:E∆ER 'Error: Please re-enter in increments of ',(⍕v[3]),'.'
∇

∇E∆List;L;m
 →(0=1↑⍴Mat)/ER1
 m←E∆Ealn Mat
 EN1:→(E∆EHN L←(1 ¯1,¯1+⍳1↑⍴Mat)E∆Piv'Enter the line numbers you wish to list')/0,EN1,0
 2 1⍴' '
 m[L+1;]
 2 1⍴' '
 →0
 ER1:E∆ER 'There are no lines to list.'
∇

∇E∆Move;m;fl;tl                                                                        
 →(0=1↑⍴m←Mat)/ER1                                                                     
 EN1:→(E∆EHN fl←(0,(¯1+1↑⍴m),1 0 10000)E∆Pin'Enter the from line numbers')/0,HP1,0     
 EN2:→(E∆EHN tl←(0,(1↑⍴Mat),0.1 0 1)E∆Pin'Enter the to line number')/EN1,HP2,EN1       
 EN4:Mat←(~(⍳(⍴fl)+1↑⍴Mat)∊(tl←⌈tl+.01)+⍳⍴fl)⍀Mat                                      
 Mat[tl+⍳⍴fl;]←m[fl+1;]                                                                
 fl←fl+(fl≥tl)×⍴fl                                                                     
 Mat←(~(⍳1↑⍴Mat)∊fl+1)⌿Mat                                                             
 E∆O'The transfer is complete.'                                                        
 →0                                                                                    
 HP1:'Enter the line numbers you wish to move from the from text.'                     
 →EN1                                                                                  
 HP2:'Enter the line number in the present text after which the new lines will appear.'
 'or enter a number between two existing lines to insert at that point,'               
 'or enter 0 to insert at the top.'                                                    
 →EN2                                                                                  
 ER1:E∆ER'There are no lines in the present text to move.'                             
∇

∇E∆New                                              
 →(∨/(⍴Mat)≠⍴orig)/EN1                              
 →(∧/∧/Mat=orig)/EN2                                
 EN1:E∆ER'Function has been modified but not saved.'
 EN2:→('yn'E∆Pis'Clear present text')/0,EN2,0,EN3,0 
 EN3:orig←Mat←0 0⍴' '                               
∇

∇E∆O c
 →(0=⎕NC'Pd')/EN1
 →('L'=1↑Pd)/0
 EN1:→(0≠⍴Cms)/0
 c
∇

∇z←E∆Omega v
 z←v/⍳⍴,v
∇

∇z←E∆PI p;l;r
 ⍎(0=⍴Cms)/'Cms←((⍴Pad)+⍴,p)↓l,0⍴l←⍞,0⍴⍞←p,Pad'
 Cms←(1+⍴z←(¯1+Cms⍳Delim[1])↑Cms)↓Cms
∇

∇r←c E∆Parse a
 r←(((0≠⍴a)×⍴r),⌈/r)⍴(,r∘.≥⍳⌈/r←¯1+(r,1+⍴a)-0,r←r/⍳⍴a)\(~r←a∈c)/a←,a
∇

∇z←m E∆Pim p;t                                                          
 EN1:→(z←E∆EHN t←E∆CS E∆PI p,'?')/END,HP,END                            
 →(1=+/z←0 0,(((1↑⍴m),⍴t)↑m)∧.=t)/0                                     
 →EN1 E∆ E∆ER 'Error: you have not entered a valid and unique response.'
 HP:'Enter ''end'' to exit or enter one of:'                            
 ⎕←(-0 10+⍴m)↑m                                                         
 →EN1                                                                   
 END:z←z[1 3],(1↑⍴m)⍴0                                                  
∇

∇n←v E∆Pin q;m;t
 ⍝ v[1] = minimum value (inclusive)                            
 ⍝ v[2] = maximum value (inclusive)                            
 ⍝ v[3] = numeric increment (i.e. 1 = integer)                 
 ⍝ v[4] = minimum number of numbers                            
 ⍝ v[5] = maximum number of numbers                            
 ⍝ Remining values are optional                                
 ⍝ v[6] = default value of empty entry (or ¯1 means no default)
 ⍝ v[7+] = numbers the entered value cannot be                 
 ⍝ q is the prompt                                             
 t←⍳0                                                          
 m←v[5]                                                        
 LP:→(m=⍴t)/EN3                                                
 EN1:→(E∆EHN n←E∆CS E∆PI q,'?')/0,0,EN2                        
 →(v[⍳5]E∆Lck n)/EN1                                           
 n[E∆Omega n='-']←'¯'                                          
 →(∨/(n←⍎n)∈6↓v)/ER1                                           
 t←t,n                                                         
 v[5]←v[5]-⍴,n                                                 
 ⍝ →LP                                                         
 EN2: →(0≠⍴t)/EN3                                              
 →(5=⍴v)/0                                                     
 →(v[6]=¯1)/0                                                  
 t←v[,6]                                                       
 EN3:⍎'n←',((m=1)/'''''⍴'),'t'                                 
 →0                                                            
 ER1:→EN1 E∆ E∆ER(⍕n), ' already exists; Please reenter.'      
∇

∇z←s E∆Pis p;t                                                                                
 EN1:→(z←(E∆EHN t←(¯1+(t≠' ')⍳1)↓t←E∆PI p,' [',s,']?'),(⍴s)⍴0)/0                              
 →(z[3+⍳⍴,s]←s=1↑t)/0                                                                         
 →EN1 E∆ E∆ER 'Invalid entry; valid responses are: ',(,((¯1↓s),[1.5]','),' '),'or ',(¯1↑s),'.'
∇

∇n←v E∆Piv q;t;m;s;b;e;a
 t←⍳0
 n←''
 s←(2≠⍴v)∧v[2]≠1
 ⍎(v[2]=¯1)/'v[2]←1⌈¯2+⍴v'
 a←s∧(m←v[2])≥¯2+⍴v
 LP:→(m≤⍴t)/EN3
 EN1:⍎'→(E∆EHN n←E∆CS E∆PI q,',(s/''', or ['),(a/'a,b,'),(s/'r]'','),'''?'')/0,HP3,EN3'
 →(a∧∧/n=(⍴n)↑'all')/EN2
 →(a∧∧/n=(⍴n)↑'but')/EN4
 →(s∧∧/n=(⍴n)↑'range')/EN5
 n[E∆Omega n='-']←'¯'
 →(v E∆Vck n)/EN1
 t←t,n←⍎n
 v[2]←v[2]-⍴,n
 →EN3
 EN2:→(v[1]>⍴n←2↓v)/ER3
 →0
 EN3:→(0=⍴t)/0
 ⍎'n←',((~s)/'''''⍴'),'t'
 →0
 EN4:→(3=⍴v)/ER1
 →(E∆EHN n←(1,(¯3+⍴v),2↓v)E∆Piv q,' - but')/EN1,0,EN1
 →(v[1]>⍴n←(~(2↓v)∊n)/2↓v)/ER3
 →0
 EN5:→(E∆EHN b←((⌊/2↓v),(⌈/2↓v),0 0 1)E∆Pin'Enter the beginning of the range')/EN1,HP1,EN1
 EN6:→(E∆EHN e←(b,(⌈/2↓v),0 0 1)E∆Pin 'Enter the ending of the range')/EN5,HP2,EN5
 n←((b≤2↓v)∧e≥2↓v)/2↓v
 →((v[1]>⍴n),v[2]<⍴n)/ER3,ER2
 t←t,n
 v[2]←v[2]-⍴n
 →EN3
 HP1:''
 'Your lower bound is ',⍕⌊/2↓v
 ''
 →EN5
 HP2:''
 'Your upper bound is ',⍕⌈/2↓v
 ''
 →EN6
 HP3:''
 →(~s,a)/0,HP4
 'Enter    all    to choose all entries available.'
 'Enter    but    to choose all entries except a few which you will'
 '                be prompted for.'
 HP4:'Enter    range  to choose all entries between s specified range.'
 ''
 →0
 ER1:→EN1 E∆ E∆ER 'There is only one entry to choose from; the ''but'' option can not be used.'
 ER2:→EN1 E∆ E∆ER 'The range you have specified is too large; re-enter up to ',(⍕v[2]),' numbers.'
 ER3:→EN1 E∆ E∆ER 'You have not entered the minimum number of numbers; re-enter ',(⍕v[1]),' numbers.'
∇

∇z←p E∆RND n
 z←(×n)×(⌊0.5+|n×10*p)÷10*p
∇

∇z←E∆RS x                                                   
 ⍎'z←',((1=⍴⍴x)↑','),'(⌽∨\⌽'' ''∨.≠x)/x←((0,¯1↑⍴x)⍴'' '')⍪x'
∇

∇E∆Replace;L;f;t;m;s
 →(0=⍴Mat)/ER1
 EN1:→(E∆EHN L←(1 ¯1,¯1+⍳1↑⍴Mat)E∆Piv'Enter the line numbers you wish to search/replace')/0,EN1,0
 EN2:→(E∆EHN f←E∆PI 'Enter the character string to be searched:')/EN1,EN2,EN1
 EN3:→(E∆EHN t←E∆PI'Enter the character string to replace:')/EN2,EN3,EN4
 EN4:m←Mat[L+1;]E∆SS f,⎕AV[1],t
 →((1↓⍴Mat)=s←(1↓⍴m)⌈1↓⍴Mat)/EN5
 Mat←((1↑⍴Mat),s)↑Mat
 EN5:Mat[L+1;]←((1↑⍴m),s)↑m
 E∆O'The string has been replaced.'
 →EN2
 ER1: E∆ER'There is no text to replace.'
∇

∇E∆Revert                                               
 →(∨/(⍴Mat)≠⍴orig)/EN1                                  
 →(∧/∧/Mat=orig)/0                                      
 EN1:→('yn'E∆Pis'Revert back to original')/0,EN1,0,EN2,0
 EN2:Mat←orig                                           
∇

∇x←e E∆SS s;rs;old;new;so;v;i;r
 →((' '=1↑0⍴e)∧' '=1↑0↑s←,s)/EN0
 →⍴0⍴⎕←'Invalid data type'
 EN0:rs←(⍴⍴e),⍴e
 →(rs[1]=0 1 2)/S0,V1,M1
 →⍴0⍴⎕←'Invalid data rank'
 S0:→V1,rs←2⍴⍴e←,e
 M1:e←,⎕AV[1],e
 V1:old←s[⍳¯1+s⍳⎕AV[1]]
 →(so←(⍴old)=⍴s)/S1
 s←(1+⍴old)↓s
 new←s[⍳¯1+s⍳⎕AV[1]]
 S1:→((0=⍴old)∨(⍴old)>¯1↑rs)/NONE
 →(0=⍴v←(((1-⍴old)↓e)=old[1])/⍳(⍴e)+1-⍴old)/NONE
 i←1+0×r←⍴old
 LP1:→(r<i←i+1)/EN1
 →(0=⍴v←(old[i]=e[v+i-1])/v)/NONE
 →LP1
 EN1:→(~so)/REPL
 →(2=rs[1])/S2
 →⍴0⍴x←v
 S2:→⍴0⍴x←⍉1+(0 1+1↓rs)⊤v-2
 REPL:i←1+⍴v
 LP2:→(0≥i←i-1)/EN2
 e←((v[i]-1)↑e),new,(v[i]+(⍴old)-1)↓e
 →LP2
 EN2:→(2=rs[1])/S3
 →⍴0⍴x←e
 S3:x←(1↓x,1+⍴e)-x←(⎕AV[1]=e)/⍳⍴e
 →⍴0⍴x←0 1↓((⍴x),⌈/x)⍴(,x∘.≥⍳⌈/x)\e
 NONE:→(~so)/NR
 →(2=rs[1])/NM
 →⍴x←⍳0
 NM:→⍴x←0 2⍴0
 NR:→(2=rs[1])/S4
 →⍴0⍴x←e
 S4:x←0 1↓(0 1+1↓rs)⍴e
∇

∇E∆Save;r
 →(0=1↑0⍴r←⎕FX Mat)/ER1
 r,' saved.'
 orig←Mat
 →0
 ER1:E∆ER 'Error on line ',⍕r-1
∇

∇E∆Screen
 →(0=1↑⍴Mat)/ER1
 (0 0⍴' ')E∆LP E∆Ealn Mat
 →0
 ER1:E∆ER'There are no lines to list.'
∇

∇r←E∆VI n                                                                       
 n←' 'E∆Parse(~(1⌽r)∧r←' '=n)/n←E∆CS n                                          
 r←(1≥+/n='.')∧(∧/'-'≠0 1↓n)∧(1≠-⌿+/∧\' .'∘.≠n)∧(∧/n∈r,'.- ')∧∨/n∊r←'0123456789'
∇

∇r←v E∆Vck n
 →(r←2=⍴v)/ER1
 →(0=1↑0⍴n)/EN1
 →(r←(¯1↑(' '≠n)/n←,n)∊' ,')/ER2
 n[E∆Omega n=',']←' '
 n[E∆Omega n='-']←'¯'
 →(r←~∧/E∆VI n)/ER2
 n←,⍎n
 EN1:→(r←(v[1]>⍴n)∨v[2]<⍴n)/ER3
 →(~r←∨/~n∊2↓v)/0
 →0 E∆ E∆ER (⍕n),' does not exist; please re-enter.'
 ER1:→0 E∆ E∆ER 'Error: there are no entries to choose from.'
 ER2:→0 E∆ E∆ER n,' is not numeric; please re-enter.'
 ER3:E∆ER 'Error: you must enter ',(⍕v[1]),' to ',(⍕v[2]),' numbers; re-enter.'
∇

⎕CT←1E¯13

⎕FC←6⍴(,⎕UCS 46 44 8902 48 95 175)

⎕IO←1

⎕L←0

⎕LX←' '
  ⎕LX←0⍴⎕LX

⎕PP←10

⎕PR←1⍴' '

⎕PS←0

⎕PW←80

⎕R←0

⎕RL←1

⎕TZ←-6

⎕X←0

