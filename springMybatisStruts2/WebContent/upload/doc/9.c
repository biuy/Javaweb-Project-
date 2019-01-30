#include<stdio.h>
#include<stdlib.h>
#define N 9
#define MAX 1000000
#define NMAX 362885 
//用于判重
char visited[NMAX];
const int fac[] = {1, 1, 2, 6, 24, 120, 720, 5040, 40320};

int end[9] = {8, 7, 6, 5, 4, 3, 2, 1, 0};

typedef struct node{
	int num[N];
	int block[4];	//不能移动的方向，1上2下3左4右
	int space;	//空格位置
	int step;	//深度
	int Cantor;	//康托展开值
}List;
List *team[MAX];//队列,指针数组

//康托展开，判重
inline int cantor(List* p)
{
	int ans = 0;
	int i, j;
	for(i = 0; i < N; i++)
	{
		int cnt = 0;
		for(j = i + 1; j < N; j++)
		{
			if(p->num[j] < p->num[i])
				cnt++;
		}
		ans += fac[8 - i] * cnt;
	}
	return ans;
}

void Print(List* p)
{
	int i;
	for(i = 0; i < N; i++)
	{
		printf("%d ",p->num[i] );
		if((i + 1) % 3 == 0)	
			printf("\n");
	}
}

int match(List* p)
{
	int i;
	for(i = 0; i < N; i++)
	{
		if(p->num[i] != end[i])
			return 0;
	}
	return 1;
}

void Block(List* p)//0上1下2左3右
{
	int blank = p->space;
	if(0 <= blank && blank <= 2)	p->block[0] = 1;
	if(6 <= blank && blank <= 8)	p->block[1] = 1;
	if(blank % 3 == 0)	p->block[2] = 1;
	if(blank == 2 || blank == 5 || blank == 8)	p->block[3] = 1;
}

List* Move(List* Now_p, int direct)
{
	int i, blank;
	List* New_p;
	//获取空格位
	blank = Now_p->space;
	//开始移动: 1上2下3左4右
	switch(direct){
		case 1: blank -= 3;	break;
		case 2: blank += 3;	break;
		case 3: blank --;	break;
		case 4: blank ++;	break;
	}
	//初始化新节点
	New_p = (List*)malloc(sizeof(List));
	for(i = 0; i < N; i++)
		New_p->num[i] = Now_p->num[i];
	New_p->space = blank;

	New_p->num[Now_p->space] = New_p->num[blank];//Now_p->space为原空格位
	New_p->num[blank] = 0;
	Block(New_p);
	New_p->step = Now_p->step + 1;
	New_p->Cantor = cantor(New_p);
	return New_p;
}
 

int Search(List* Begin)//bfs部分
{	
	List *g = NULL, *g1, *g2;
	int i, front = 0, rear = 1;
	team[front] = Begin;
	while(rear != front)
	{
		g1 = team[front];
		if(g != NULL)
			if(match(g))
				break;
		for(i = 0; i < 4; i++)
		{
			if(g1->block[i] == 1)	continue;
			g2 = Move(g1, i + 1);

			if(visited[g2->Cantor]) continue;
			visited[g2->Cantor] = 1;	//判重
			//Print(g2); 

			if(g2 != g1)
			{
				switch(i + 1)
				{
					case 1: g2->block[1] = 1; break;
					case 2: g2->block[0] = 1; break;
					case 3: g2->block[3] = 1; break;
					case 4: g2->block[2] = 1; break;
				}
				team[rear] = g2;
				if(match(g2))	
				{
					g = g2;
					break;
				}
				rear++;
			}
		}
		front++;
	}
	return g->step;
}

int main()
{
	int i;
	List node;
	List* Begin;
	//初始化第一个节点
	for(i = 0; i < 9; i++)
		scanf("%d", &node.num[i]);
	for(i = 0; i < N; i++)
		if(node.num[i] == 0)
		{
			node.space = i;
			break;
		}
	Begin = &node;

	Begin->step = 0;
	Block(Begin);
	visited[0] = 1;
	if(match(Begin))	printf("0\n");
	else	printf("%d\n", Search(Begin));
} 
