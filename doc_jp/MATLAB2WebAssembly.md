# MATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript
# 0. �͂��߂�


MATLAB Central �� Generate JavaScript Using MATLAB Coder �Ȃ�c�[���������܂����BMATLAB Coder ���g���� MATLAB ���� C++ �ɕϊ�������A����� WebAssembly �ɂ܂ł����Ă����c�[���̂悤�ł��B���܂� JavaScript �͐G���Ă��Ȃ������ł����A�����ŕϊ��ł���Ȃ����Ă݂邩�E�E�ƗV��ł݂��b�B




![image_0.png](MATLAB2WebAssembly_images/image_0.png)


  


WebAssembly �ɂ��Ă͈ȉ��̂Q�L�����Q�l�ɂȂ�܂����B



   -  [Qiita: WebAssembly�Ƃ�](https://qiita.com/ShuntaShirai/items/3ac92412720789576f22) 
   -  [Qiita: WebAssembly�Ƃ́H- ���ۂ�C������u���E�U�œ�����-�y2019�N6���Łz](https://qiita.com/umamichi/items/c62d18b7ed81fdba63c2) 



WebAssembly �̓v���O�������u���E�U�ō������s���邽�߂̃o�C�i���Ƃ��āAJavaScript ����Ăяo���`�ŗ��p�����Ƃ̂��ƁB�����I�ȏ����̍������AC/C++���̑�����ŏ����ꂽ�����A�v�����ڐA����̂ɗL�������ł��B


  
# ���������


�ȑO Qiita �ɂ����e�����l�^�i[�yMATLAB \& Python�z�œK���v�Z�� Google Sheets �̓ǂݏ���](https://qiita.com/eigs/items/4182fcd9b5da748ef77e)�j�ł����B




**�u�o�����X�����ꂽ�ۗL������ڕW�����ɋ߂Â��邽�߂ɂ͊e���������������΂����̂��v**




�ɂ��܂��B�ȑO�̓��e�ł͂��̌v�Z�� MATLAB �� fmincon �� Google Sheets + Python ���g���Ă��܂������A����̓u���E�U��Ŋ��������悤�Ƃ����̂��ŏI�I�ȑ_���ł����A�܂��� MATLAB �� fmincon �̔���`�œK���v�Z�� JavaScript �Ŏ��s�����镔�����܂Ƃ߂܂��BUI �͂��������׋����K�v�����Ȃ̂ł܂�����B


  


��{�I�ɂ� Generate JavaScript Using MATLAB Coder �ŗp�ӂ���Ă���  [���: Pass Data to a Library](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fjp.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2Fbd0e1def-822e-40bc-8a7f-5842c7197c5e%2Fe7abd4d2-be59-4ad2-858e-3f1046727acf%2Ffiles%2Fexamples%2FcreateLibrary%2FPassingDataArray.mlx&embed=web) �̗���ɉ����č�Ƃ��Ă��܂��B


  


MATLAB �w�r�[���[�U�[�ɂ̓������̎�舵�������g���b�L�[�ł����B�B


  


�R�[�h�����炩��F [GitHub: minoue-xx/MATLAB2WASM_sample](https://github.com/minoue-xx/MATLAB2WASM_sample)




���s�y�[�W�͂�����F[Github Pages: MATLAB2WASM_sample](https://minoue-xx.github.io/MATLAB-to-WebAssembly-sample/)�i�����ڂɂ͌����܂��񂪁j


  
## ��

   -  MATLAB (R2019b2) 
   -  Optimization Toolbox 
   -  MATLAB Coder 
   -  [File Exchange: Generate JavaScript Using MATLAB Coder](https://jp.mathworks.com/matlabcentral/fileexchange/69973-generate-javascript-using-matlab-coder) v2.0.2 
   -  [Emscripten Development Kit](https://emscripten.org/index.html) v1.39.1 
   -  Google Chrome 

# 1. �c�[���̐ݒ�


File Exchange ���� [Generate JavaScript Using MATLAB Coder](https://jp.mathworks.com/matlabcentral/fileexchange/69973-generate-javascript-using-matlab-coder) ���C���X�g�[���B�܂��J�� `Setup.mlx` �ɏ]���� Emscripten Development Kit �̍ŐV�ł��C���X�g�[�����܂��B�l�b�g���[�N�t�H���_���Ƃ��܂������Ȃ������̂ŁA���[�J���ɃC���X�g�[�����������B


  
# 2. MATLAB Project �쐬


Generate JavaScript Using MATLAB Coder �ł� [MATLAB Project](https://jp.mathworks.com/help/matlab/projects.html) ���g�p���܂��B




��ƃt�H���_�Ɉړ����āA�ȉ������s�B�o�͌`���� Dynamic Libeary (dll) �ł��B


```matlab
proj = webcoder.setup.project("optimizePosition","Directory",pwd,"OutputType",'dll');
```
  
# 3. MATLAB �֐��쐬


����`�œK�������{����֐� `getPosition2Add.m` �����܂��B���e�� [Qiita:�yMATLAB \& Python�z�œK���v�Z�� Google Sheets �̓ǂݏ���](https://qiita.com/eigs/items/4182fcd9b5da748ef77e) �ŏЉ�����̂Ƃقړ����ł����A�R�[�h�����p�ɓ��͈����̃T�C�Y�E�f�[�^�^�𖾎����܂��B�R�[�h�S���͂�����F [GitHub](https://github.com/minoue-xx/MATLAB2WASM_sample)


  
```matlab
% getPosition2Add.m(�ꕔ)
function xlong = getPosition2Add(target_pf, price, position)

% Specify the Dimensions and Data Types
assert(isa(target_pf, 'double'));
assert(isa(price, 'double'));
assert(isa(position, 'double'));
assert(all( size(target_pf) == [ 1, 10 ]))
assert(all( size(price) == [ 1, 10 ]))
assert(all( size(position) == [ 1, 10 ]))

%(�ȉ���)
```
  


�����ł͍ő�10�����܂őΉ�����z��œ��͔z��T�C�Y�� 1x10 �̃x�N�g���Ƃ��ăR�[�h�������܂��B




MATLAB Coder ���̂́u�z��T�C�Y�͍ő�10�܂Łv�Ƃ����ݒ���\�Ȃ�ł����A�Ȃ��� WebAssembly �܂ł����Ă����ƃ������G���[���ł܂����B�����͒������B�֐����ł�����A`getPosition2Add.m` ���v���W�F�N�g�ɒǉ����āA���x���� UserEntryPoints > Function �ɐݒ肵�Ă����܂��B




![image_1.png](MATLAB2WebAssembly_images/image_1.png)


  


����Ȋ����B


  
# 4. JavaScript �� WebAssembly �̐���


�ȉ��̃R�[�h�� MATLAB Project ����r���h���܂��B���� MATLAB Coder + Emscripten SDK �������Ă���͗l�B


```matlab
proj = openProject(pwd);
webcoder.build.project(proj);
```


C++ �R�[�h�� build �t�H���_�ɏo�͂���܂��B����ɁA���� C++ �R�[�h�� `optimizeposition.js` �� `optimizeposition.wasm` �ɃR���p�C������āAdist �t�H���_�ɏo�͂���܂��B


  
# 5. HTML/JavaScript ����Ăяo��


���āA�悤�₭�{��BMDN �ɂ���


  


JavaScript typed arrays are array-like objects and provide a mechanism for accessing raw binary data.


  


�Ƃ̂��ƂŁA���� JavaScript typed arrays ���g���āAJavaScript ���� optimizeposition.wasm �ƃf�[�^������肵�܂��B


  
## �����̗���

   1.  JavaScript typed array ���쐬 
   1.  typed array �̗v�f������K�v�ȗ̈���v�Z�Awasm ���̃��������m�� 
   1.  �m�ۂ����̈�� typed array �̒l���R�s�[ 
   1.  wasm ���̌v�Z���������s 
   1.  wasm ���̃��������� typed array �ɒl���R�s�[ 
   1.  �s�v�ɂȂ����̈����� 



1-3 �̏��������Ă���̂� `_arrayToHeap`�A5 �� `_heapToArray `�ł��B�����̏ڍׂ� [Guthub: Planeshifter/emscripten-examples](https://github.com/Planeshifter/emscripten-examples/tree/master/01_PassingArrays) �� README.md �̋L�q���Q�l�ɂȂ�܂��B


  
```matlab
script.js
    // JavaScript Array to Emscripten Heap
    function _arrayToHeap(typedArray) {
        var numBytes = typedArray.length * typedArray.BYTES_PER_ELEMENT;
        var ptr = Module._malloc(numBytes);
        var heapBytes = new Uint8Array(Module.HEAPU8.buffer, ptr, numBytes);
        heapBytes.set(new Uint8Array(typedArray.buffer));
        return heapBytes;
    }
    // Emscripten Heap to JavasSript Array
    function _heapToArray(heapBytes, array) {
        return new Float64Array(
            heapBytes.buffer,
            heapBytes.byteOffset,
            heapBytes.length / array.BYTES_PER_ELEMENT);
    }
    // Free Heap
    function _freeArray(heapBytes) {
        Module._free(heapBytes.byteOffset);
    }
    // Example of Passing Data Arrays
    var Module = {
        onRuntimeInitialized: function () {
            var target_pf = [0.275, 0.125, 0.2, 0.1, 0.1, 0.15, 0.05, 0, 0, 0];
            var price = [155.83, 90.4, 42.78, 42.50, 142.56, 112.93, 39.23, 0, 0, 0];
            var position = [12, 20, 40, 15, 6, 18, 12, 0, 0, 0];
            // Create Data    
            var Target_pf = new Float64Array(target_pf);
            var Price = new Float64Array(price);
            var Position = new Float64Array(position);
            var Position2Add = new Float64Array(10);
            // Move Data to Heap
            var Target_pfbytes = _arrayToHeap(Target_pf);
            var Pricebytes = _arrayToHeap(Price);
            var Positionbytes = _arrayToHeap(Position);
            var Position2Addbytes = _arrayToHeap(Position2Add);
            // Run Function
            Module._optimizeposition_initialize();
            Module._getPosition2Add(Target_pfbytes.byteOffset, Pricebytes.byteOffset, Positionbytes.byteOffset, Position2Addbytes.byteOffset)
            Module._optimizeposition_terminate();
            //  Copy Data from Heap
            Position2Add = _heapToArray(Position2Addbytes, Position2Add);
            var position2add = Array.from(Position2Add);
            // Free Data from Heap
            _freeArray(Target_pfbytes);
            _freeArray(Pricebytes);
            _freeArray(Positionbytes);
            _freeArray(Position2Addbytes);
            // Display Results
            console.log(position + " + " + position2add);
        }
    };
```
  
## 6. ���Č��ʂ��݂Ă݂悤


���[�J���T�[�o�𗧂ĂČ��ʂ��݂Ă݂܂��BFetch API �� file URI Scheme ���T�|�[�g���Ă��Ȃ����߁A�t�@�C���� http URI Scheme �ŃA�N�Z�X�ł���悤�ɂ���K�v������炵���BGenerate JavaScript Using MATLAB Coder �ɂ͊֐����p�ӂ���Ă܂��̂ł�����g���܂��B


  


��ق� `.js` �� `.wasm` ���o�͂��ꂽ�t�H���_ dist �� index.html ��u���܂��BMATLAB ��� dist ���J�����g�t�H���_�ɂ��āA


  
```matlab
server = webcoder.utilities.DevelopmentServer("Port",8125)
start(server);
web('http://localhost:8125')
% �T�[�o�𗎂Ƃ��Ƃ���
% stop(server);
```


Chrome �ŊJ���� [Ctrl] + [Shift] + [i] �ňȉ��̒ʂ�B[Github Pages: MATLAB2WASM_sample](https://minoue-xx.github.io/MATLAB2WASM_sample/) �ł��m�F�ł��܂��B




![image_2.png](MATLAB2WebAssembly_images/image_2.png)


  


�v�Z�͂ł��Ă���͗l�B


  


�����v�Z�� MATLAB �Ŏ����Ɏ��s���Ă݂�ƁA


  
```matlab
target_pf = [0.275, 0.125, 0.2, 0.1, 0.1, 0.15, 0.05, 0, 0, 0];
price = [155.83, 90.4, 42.78, 42.50, 142.56, 112.93, 39.23, 0, 0, 0];
position = [12, 20, 40, 15, 6, 18, 12, 0, 0, 0];
xlong = getPosition2Add(target_pf, price, position)
```


��


```matlab
xlong =
  Columns 1 through 9
     7     0     9     8     0     0     0     0     0
  Column 10
     0
```


�ƂȂ�A�������ʂł��邱�Ƃ�������܂��B�߂ł����߂ł����B


  
# �܂Ƃ�


�ЂƂ܂� MATLAB �ŏ������œK���v�Z�� JavaScript ���琳�����Ăяo���Ă��邱�Ƃ��m�F�ł��܂����B


  


���� `price` ��ۗL�� `position` �̒l���z��T�C�Y�����ߑł��ȏ󋵂ŁA���ʂ��R���\�[���ɕ\�����邾���ł��̂ŁA����ł͂܂��g�����ɂȂ�܂���BUI����̂����ς͌�قǂ���Ă݂�\��ł��B


  
## �Q�l

   -  [Qiita: ���ƃ\���o�[�Ŏg�����Ƃ�Emscripten�̎d�g�݂𒲂ׂĂ݂�](https://qiita.com/bellbind/items/c37183dd4b7eb9949b9a) 
   -  [�yWebAssembly�zJS���ō쐬����typed array��wasm���ɓn��](http://blog.shogonir.jp/entry/2017/05/23/232600) 
   -  [Guthub: Planeshifter/emscripten-examples](https://github.com/Planeshifter/emscripten-examples/tree/master/01_PassingArrays) 
   -  [MDN Web docs: JavaScript typed arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays) 
   -  [WebAssembly �J�����\�z�̖{�FWebAssembly ����](https://wasm-dev-book.netlify.com/hello-wasm.html) 



���� [�yWebAssembly�zJS���ō쐬����typed array��wasm���ɓn��](http://blog.shogonir.jp/entry/2017/05/23/232600)�Ō��J����Ă��鑽���̗�����ϋM�d���Ǝv���܂��B������܂����B���肪�Ƃ��������܂��B


# Appendix 1. getPosition2Add.m
```matlab
function xlong = getPosition2Add(target_pf, price, position)

% Specify the Dimensions and Data Types
assert(isa(target_pf, 'double'));
assert(isa(price, 'double'));
assert(isa(position, 'double'));
assert(all( size(target_pf) == [ 1, 10 ]))
assert(all( size(price) == [ 1, 10 ]))
assert(all( size(position) == [ 1, 10 ]))

idx = target_pf > 0;
target_pf = target_pf(idx);
price = price(idx);
position = position(idx);
N = sum(idx);

% ���ꂼ��̖��������w������΃^�[�Q�b�g�Ƃ���ۗL�����ɋ߂Â��������߂܂��B ���̍ۂ̐���� Cost�F���v���h���܂ł̍w���Ƃ��邩 �����ł� 2k
% (�� 20���~�j�Ƃ��܂��B

Cost = 2e3; % $2k

% ���`�s��������i���v�R�X�g�� Cost �ȉ��j
A = price;
b = Cost;
% ���`��������͂Ȃ�
Aeq = [];
beq = [];
% �w�����̏㉺��
lb = zeros(1,N);
ub = inf(1,N);
% �����l�� 0�B
x0 = zeros(1,N);

options = optimoptions('fmincon','Algorithm','sqp');

% �ړI�֐��� getDiff �Œ�`����Ă��܂��B
% �^�[�Q�b�g�ۗ̕L�����Ƃ̌덷���a���������ŏ��Ƃ��邱�Ƃ�ڎw���܂��B
objfun = @(x2add) getDiff(x2add,price,position,target_pf);
x = fmincon(objfun,x0,A,b,Aeq,beq,lb,ub,[],options);

% fmincon ���g�p
% �{���͐������ł��������Ŋ��������߂���A�[���͖������܂��B
% �w��������������΂����܂Ŗ��ɂ͂Ȃ�Ȃ����߁B
% �������w�����������Ȃ��ꍇ�͉e�������邽�ߒ����͍s���Ă���݂����ł����A
% ���̕��@�̓��{�A�h�o�C�U�[ THEO �������i�v���p�j
% �w�������̏����_�ȉ��؂�̂�
xlong = zeros(1,10);
xlong(1:N) = floor(x);

end

function errorRMS = getDiff(position2add,marketvalue,position,target_pf)
newTotal = marketvalue.*(position2add+position);
newPF = newTotal/sum(newTotal);
errorRMS = sqrt(sum( (newPF - target_pf).^2 ) );
end
```
  
  
# Appendix 1. index.html
```matlab
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Position to add</title>
</head>

<body>
    <script async type="text/javascript" src="optimizeposition.js"></script>
    <script>
        // JavaScript Array to Emscripten Heap
        function _arrayToHeap(typedArray) {
            var numBytes = typedArray.length * typedArray.BYTES_PER_ELEMENT;
            var ptr = Module._malloc(numBytes);
            var heapBytes = new Uint8Array(Module.HEAPU8.buffer, ptr, numBytes);
            heapBytes.set(new Uint8Array(typedArray.buffer));
            return heapBytes;
        }
        // Emscripten Heap to JavasSript Array
        function _heapToArray(heapBytes, array) {
            return new Float64Array(
                heapBytes.buffer,
                heapBytes.byteOffset,
                heapBytes.length / array.BYTES_PER_ELEMENT);
        }
        // Free Heap
        function _freeArray(heapBytes) {
            Module._free(heapBytes.byteOffset);
        }
        // Example of Passing Data Arrays
        var Module = {
            onRuntimeInitialized: function () {
                var target_pf = [0.275, 0.125, 0.2, 0.1, 0.1, 0.15, 0.05, 0, 0, 0];
                var price = [155.83, 90.4, 42.78, 42.50, 142.56, 112.93, 39.23, 0, 0, 0];
                var position = [12, 20, 40, 15, 6, 18, 12, 0, 0, 0];
                // Create Data    
                var Target_pf = new Float64Array(target_pf);
                var Price = new Float64Array(price);
                var Position = new Float64Array(position);
                var Position2Add = new Float64Array(10);
                // Move Data to Heap
                var Target_pfbytes = _arrayToHeap(Target_pf);
                var Pricebytes = _arrayToHeap(Price);
                var Positionbytes = _arrayToHeap(Position);
                var Position2Addbytes = _arrayToHeap(Position2Add);
                // Run Function
                Module._optimizeposition_initialize();
                Module._getPosition2Add(Target_pfbytes.byteOffset, Pricebytes.byteOffset, Positionbytes.byteOffset, Position2Addbytes.byteOffset)
                Module._optimizeposition_terminate();
                //  Copy Data from Heap
                Position2Add = _heapToArray(Position2Addbytes, Position2Add);
                var position2add = Array.from(Position2Add);
                // Free Data from Heap
                _freeArray(Target_pfbytes);
                _freeArray(Pricebytes);
                _freeArray(Positionbytes);
                _freeArray(Position2Addbytes);
                // Display Results
                console.log(position + " + " + position2add);
            }
        };
    </script>
</body>

</html>
```
