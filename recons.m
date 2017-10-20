filename = "rleop.txt";
c=1;
rle=[];
fid = fopen (filename, "r");
fid1 = fopen ("rlerecons.txt", "w");
while (! feof (fid) )
  text_line = fgetl (fid);
  A = regexp(text_line, sprintf('\\w{1,%d}', 8), 'match');
  [m n] = size(A);
  v=[];
  for i=1:n
    z=A{1,i}(1);
    x=bin2dec(A{1,i}(2:8));
    for i=1:x
      v=[v,str2num(z)];
#    fprintf(fid1,A{1,i});
#    fprintf(fid1,'\n');
    endfor
  endfor
  fdisp(fid1,v);
  rle=[rle;v];
endwhile
fclose(fid1);
fclose (fid);
rle
imwrite(rle,"image.bmp");

imshow(rle);


