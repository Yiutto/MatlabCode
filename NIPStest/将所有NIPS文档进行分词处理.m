%1.AllTextNames.txt中包含所有文档的名字
text_names=textread('AllTextNames.txt','%s');
%添加文档后缀名
fname=strcat(text_names,'.txt');
for i=1:length(fname)
    fid1=fopen(fname{i},'r');
    text=[];
    while 1
        tline=fgetl(fid1);
        if ~ischar(tline)
            break;
        end
        text=[text,tline];
        %人为添加空白分隔符
        text=[text,' '];
    end
    fclose(fid1);
    %strrep(str1,str2,str3)它把str1中所有的str2字串用str3来替换
    text=strrep(text,'- ','');
    %2.通过正则表达式获得文档中的英文单词
    str='[a-zA-Z]+';
    word=regexpi(text,str,'match');
    %获得Abstract的位置,从文档开头到Abstract进行删除
    Abs_idex=find(cellfun(@(x) strcmp(x,'Abstract'),word));
    word(1:Abs_idex)=[];
    %获得References的位置,从References到文档末尾进行删除
    Ref_idex=find(cellfun(@(y) strcmp(y,'References'),word));
    word(Ref_idex:end)=[];
    %3重新刷新写入word中的cell数组到原文档中
    fid2=fopen(fname{i},'w+');
    for j=1:length(word)
        fprintf(fid2,'%s',word{j});
        fprintf(fid2,' ');
    end
    fclose(fid2);
end
fprintf('共计%d篇txt文档分词完毕！',length(fname));
    