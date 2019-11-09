% https://wasm-dev-book.netlify.com/hello-wasm.html
% ���ӓ_�Ƃ��� Fetch API �� file URI Scheme[4]���T�|�[�g���Ă��Ȃ�����, 
% �C�ӂ� HTTP �T�[�o�� index.html �� js, wasm ��
% �z�M���ăt�@�C���� http URI Scheme �ŃA�N�Z�X�ł���悤�ɂ���K�v������܂�. 
%% step1
proj = webcoder.setup.project("optimizePosition","Directory",pwd,"OutputType",'dll');
%% step2
proj = openProject(pwd);
webcoder.build.project(proj);

%% step3
% on dist folder
server = webcoder.utilities.DevelopmentServer("Port",8125);
start(server);
web('http://localhost:8125')
%%
stop(server);