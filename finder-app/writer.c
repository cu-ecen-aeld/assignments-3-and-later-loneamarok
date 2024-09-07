#include<syslog.h>
#include<stdio.h>
#include<stdlib.h>

int main(int argc, char **argv)
{
    // Init
    int err;
    openlog("messages", LOG_PID, LOG_USER);
    if(argc != 3)
    {
        fprintf(stderr, "2 arguements expected!\n");
        syslog(LOG_ERR, "2 args expected\n");
        exit(1);
    }
    char *file_name = argv[1];
    char *writestr = argv[2];
    FILE *fptr;
    // Create a file
    fptr = fopen(file_name, "w");
    if(!fptr)
    {
        perror("Error encounters while openning file");
        syslog(LOG_ERR, "Failed to open the file!\n");
        exit(1);
    }

    syslog(LOG_DEBUG, "Writing %s to file %s\n", file_name, writestr);
    // Write to the file
    fprintf(fptr, "%s", writestr);
    fclose(fptr);
}