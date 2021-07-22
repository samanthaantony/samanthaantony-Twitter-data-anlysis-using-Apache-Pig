--F= LOAD 'small-twitter.csv' USING PigStorage(',') AS (User_ID:int,Follower_ID:int);
F= LOAD '$G' USING PigStorage(',') AS (User_ID:int,Follower_ID:int);
A= group F by Follower_ID;
L= FOREACH A GENERATE $0, COUNT($1);
B= group L by $1;
O= FOREACH B GENERATE $0,COUNT($1);  
--DUMP O
STORE O INTO 'output' USING PigStorage (',');