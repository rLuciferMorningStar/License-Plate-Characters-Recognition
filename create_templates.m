%   TEMPLATE CREATION
%   Alphabets
A = imread('characters/A.bmp'); B = imread('characters/B.bmp');
C = imread('characters/C.bmp'); D = imread('characters/D.bmp');
E = imread('characters/E.bmp'); F = imread('characters/F.bmp');
G = imread('characters/G.bmp'); H = imread('characters/H.bmp');
I = imread('characters/I.bmp'); J = imread('characters/J.bmp');
K = imread('characters/K.bmp'); L = imread('characters/L.bmp');
M = imread('characters/M.bmp'); N = imread('characters/N.bmp');
O = imread('characters/O.bmp'); P = imread('characters/P.bmp');
Q = imread('characters/Q.bmp'); R = imread('characters/R.bmp');
S = imread('characters/S.bmp'); T = imread('characters/T.bmp');
U = imread('characters/U.bmp'); V = imread('characters/V.bmp');
W = imread('characters/W.bmp'); X = imread('characters/X.bmp');
Y = imread('characters/Y.bmp'); Z = imread('characters/Z.bmp');

Afill = imread('characters/fillA.bmp');
Bfill = imread('characters/fillB.bmp');
Dfill = imread('characters/fillD.bmp');
Ofill = imread('characters/fillO.bmp');
Pfill = imread('characters/fillP.bmp');
Qfill = imread('characters/fillQ.bmp');
Rfill = imread('characters/fillR.bmp');

%   Numbers
%Number
one = imread('characters/1.bmp');     two = imread('characters/2.bmp');
three = imread('characters/3.bmp');   four = imread('characters/4.bmp');
five = imread('characters/5.bmp');    six = imread('characters/6.bmp');
seven = imread('characters/7.bmp');   eight = imread('characters/8.bmp');
nine = imread('characters/9.bmp');    zero = imread('characters/0.bmp');

zerofill = imread('characters/fill0.bmp');
fourfill = imread('characters/fill4.bmp');
sixfill = imread('characters/fill6.bmp');
sixfill2 = imread('characters/fill6_2.bmp');
eightfill = imread('characters/fill8.bmp');
ninefill = imread('characters/fill9.bmp');
ninefill2 = imread('characters/fill9_2.bmp');

%   Vector for alphabets
alphabets = [A Afill B Bfill C D Dfill E F G H I J K L M N O Ofill P Pfill Q Qfill R Rfill S T U V W X Y Z];
%   Vector for digits
numbers = [one two three four fourfill five six sixfill sixfill2 seven eight eightfill nine ninefill ninefill2 zero zerofill];
%   Vector for all characters (alphabets + numbers)
character = [alphabets numbers];
%   New Templates database creation
NewTemplates = mat2cell(character,42,[24 24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24]);