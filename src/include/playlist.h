
#ifndef SHELLFM_PLAYLIST
#define SHELLFM_PLAYLIST

#include "hash.h"

struct tracknode;

struct tracknode {
	struct hash track;
	struct tracknode * next;
};

struct playlist {
	struct tracknode * track;
	char * title;
	unsigned left;
	int continuous, discovery;
};

extern int expand(struct playlist *);
extern int parsexspf(struct playlist *, const char *);
extern void freelist(struct playlist *);

extern void push(struct playlist *, struct tracknode *);
extern void shift(struct playlist *);

#endif
