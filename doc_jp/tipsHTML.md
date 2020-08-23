# UI�ҁFMATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript
# 0. �͂��߂�


�ȑO�AWebAssembly �𐶐����� MATLAB �� `fmincon` ���u���E�U��Ŏ��s����b�������܂������A����� UI ���������Ă݂��̂ł��Љ�B




�l�O�ɏo����悤�ȃR�[�h�ł͂Ȃ��C�������ł����A�܂����ď��X�ɉ��ǂ������̂Ńq���g������΂��ЃR�����g���������B�X�������肢�v���܂��B




���s�y�[�W�͂�����FGithub Pages: [Rebalance Portfolio](https://minoue-xx.github.io/rebalance_portfolio/)




�R�[�h�����炩��F GitHub: [minoue-xx/rebalance_portfolio](https://github.com/minoue-xx/rebalance_portfolio)




MATLAB -> WebAssembly �̎����ϊ������ɂ��Ă͂�����̋L�����Q�Ƃ��������B




[Qiita: MATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript](https://qiita.com/eigs/items/68cdcec7b8d56a5b440f)


  
# 1. �p�r�Ǝg������


�ړI�͈�т���




**�u�o�����X�����ꂽ�ۗL������ڕW�����ɋ߂Â��邽�߂ɂ͊e���������������΂����̂��v**




�Ƃ������Ƃł����A�I�����́u�����v�̂݁B���o�����X�Ƃ͌������̂̔��邱�Ƃ͍l���Ă��܂���B�ϗ������H




�ȉ��A�����ʁiGIF�j�ł��B




![image_0.png](tipsHTML_images/image_0.png)




����Ȋ����B


  


**Step 1: ���݂̃|�[�g�t�H���I�\��**




�ۗL�����E���� csv �t�@�C������ǂݍ��݂܂��B�����ɃT���v���f�[�^����J�n���Ă��悵�B




���݉��i�⏬�v�E���v�E�����͎����v�Z���܂��B�K�v������Ζ����E�ۗL���ȂǕύX���Ă݂Ă��������Bcsv �t�@�C���̃t�H�[�}�b�g�͈ȉ��̗l�ɂ��Ă��������B[Ticker],[�ۗL��],[�ڕW�ۗL����]�̏��B


  


**Step 2: �\�Z�z����**




�g����z����͂��� [Rebalance]�{�^�����N���b�N�B


  


**Step 3: �K�v�w�������v�Z�E���ʕ\��**




Target\% (�ړI�ۗ̕L����) �ɋ߂Â��܂����ˁB


  
# 2. �g�p�����ׂ����v�f�ɂ���


JavaScript �͏��߂Ă������̂Ō������Ȃ���{�����Ƀq���g��������č\�z���܂����B����Ă��邱�Ƃ͊�{�I�Ȃ��Ƃ��Ɓi�H�j�v���܂��̂ŁA�����ώQ�l�E�׋��ɂȂ���������ׂĂ����܂��B**0.**** **[**Finantial Modeling Prep**](https://financialmodelingprep.com/)




�����{�F�ؕs�v�Ƃ��������ŒT���āA�������͂����� API ���g���܂����B




�i����API�ꗗ�F[https://github.com/public-apis/public-apis�j](https://github.com/public-apis/public-apis%EF%BC%89)


  


1. [Qiita: let��var�̈Ⴂ](https://qiita.com/y-temp4/items/289686fbdde896d22b5e)




�܂��͂���B�����ȕ��̃R�[�h���R�s�y�����̂ŁAvar �� let �����݂��Ă��܂����Blet �ɓ��ꂷ��ۂɁA�m��Ȃ������X�R�[�v�̈Ⴂ�ŃG���[���N����Ȃǂ��Ă����ۂɎQ�l�ɂȂ�܂����B


  


2. [Using jQuery to Perform Calculations in a Table](https://www.dotnetcurry.com/jquery/1189/jquery-table-calculate-sum-all-rows)




����̃y�[�W�\���̃x�[�X�ɂȂ��Ă��܂��B


  


3. [�yjQuery����zfind()�Ŏq�v�f���擾�����@�܂Ƃ߁I](https://www.sejuku.net/blog/37474)




��𗝉�����̂ɏ�����܂����Bclass�����ł���΁u. �v�Aid�����ł���΁u\#�v�B


  


4. [Read CSV File in jQuery using HTML5 File API](https://www.aspsnippets.com/Articles/Read-CSV-File-in-jQuery-using-HTML5-File-API.aspx)




csv �t�@�C���̓ǂݍ��ݕ����́A�قڂ�����̃R�s�y�B


  


5. [How to convert a currency string to a double with jQuery or Javascript? - Stack Overflow](https://stackoverflow.com/questions/559112/how-to-convert-a-currency-string-to-a-double-with-jquery-or-javascript)




���z�̕\�����Č��\�ʓ|�������B


```matlab
(12345.67).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');  // 12,345.67
```


���g�킹�Ă��炢�܂����B


  


6. [How can I format numbers as currency string in JavaScript? - Stack Overflow](https://stackoverflow.com/questions/149055/how-can-i-format-numbers-as-currency-string-in-javascript)




���z�\�����琔�l�ɖ߂������͈ȉ��ŁB


```matlab
var currency = "$123,456.00";
var number = Number(currency.replace(/[^0-9\.]+/g,""));
```
  
  
# 3. ��������: WebAssembly ������ MATLAB �R�[�h


[Qiita: MATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript](https://qiita.com/eigs/items/68cdcec7b8d56a5b440f)�@�ŏЉ�����̂Ƃقړ����ł����A



   1.  `budget` �\�Z�z�i�X�J���[�l�j����͂Ƃ��Ēǉ� 
   1.  �����l�͗\�Z�z��ړI�ۗL�����ŕ��z�����l���g�p 



��2�_��ύX���Ă��܂��B���ʂ������l�Ɉˑ��i�Ǐ������o���āj���܂��_�ɂ��ẮA�܂������Ă݂܂��B


# Appendix: getPosition2Add.m
```matlab
function xlong = getPosition2Add(target_pf, price, position, budget)

% Specify the Dimensions and Data Types
assert(isa(target_pf, 'double'));
assert(isa(price, 'double'));
assert(isa(position, 'double'));
assert(isa(budget, 'double'));
assert(all( size(target_pf) == [ 1, 10 ]))
assert(all( size(price) == [ 1, 10 ]))
assert(all( size(position) == [ 1, 10 ]))
assert(all( size(budget) == [ 1, 1 ]))

idx = target_pf > 0;
target_pf = target_pf(idx);
price = price(idx);
position = position(idx);
N = sum(idx);

% ���ꂼ��̖��������w������΃^�[�Q�b�g�Ƃ���ۗL�����ɋ߂Â��������߂܂��B
%�@���̍ۂ̐���� Cost�F���v���h���܂ł̍w���Ƃ��邩
Cost = budget(1);

% ���`�s��������Ȃ�
A = [];
b = [];
% ���`��������i���v�R�X�g�� Cost �j
% Aeq = [];
% beq = [];
Aeq = price;
beq = Cost;
% �w�����̏㉺��
lb = zeros(1,N);
ub = inf(1,N);
% �����l�� Cost �� target_pf �Ŋ���U�����ۂ̒l���g�p
x0 = Cost*target_pf./(price);

options = optimoptions('fmincon','Algorithm','sqp');

% �ړI�֐��� getDiff �Œ�`����Ă��܂��B
% �^�[�Q�b�g�ۗ̕L�����Ƃ̌덷���a���������ŏ��Ƃ��邱�Ƃ�ڎw���܂��B
objfun = @(x2add) getDiff(x2add,price,position,target_pf);
x = fmincon(objfun,x0,A,b,Aeq,beq,lb,ub,[],options);

% fmincon ���g�p
% �{���͐������ł��������Ŋ��������߂���A�[���͖������܂��B
% �w��������������΂����܂Ŗ��ɂ͂Ȃ�Ȃ�����
% �w�������̏����_�ȉ��؂�̂�
xlong = zeros(1,10);
xlong(1:N) = floor(x);

end

```
```matlab
function errorRMS = getDiff(position2add,marketvalue,position,target_pf)
newTotal = marketvalue.*(position2add+position);
newPF = newTotal/sum(newTotal);
errorRMS = sqrt(sum( (newPF - target_pf).^2 ) );
end
```
