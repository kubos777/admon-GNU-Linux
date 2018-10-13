#include <stdio.h>
#include <pwd.h>
#include <time.h>
#include <lastlog.h>
#include <string.h>
#include <utmp.h>
#include <stdlib.h>

/* change as appriopriate */
#define FOAD_LOG "/usr/adm/foad.log"


int main( int argc, char *argv[] )
{
FILE *f;

  /* protection from calling it 'manually' by users */
  if( argv[0][0] != '-' )
  {
    /* why this program is called foad */
    printf( "ESTE PROGRAMA NO PUEDE SER EJECUTADO DIRECTAMENTE.\n" );
    exit( 1 );
  }

  /* open the log file */
  f = fopen( FOAD_LOG,  );
  if( f )
  {
  struct passwd *ent;
  struct tm *tm;
  struct utmp ut;
  char buf[1024], tty[100];
  long t;
  FILE *uf;

    ent = getpwuid( getuid() );
    time( &t )
    tm = localtime( &t );
    strftime( buf, 1000, '%y-%m-%d:%T", tm );
    strcpy( tty, "???" );
    if( ent )
    {
    struct utmp ut;
      /* get the entry from utmp */
      if( uf = fopen( "/etc/utmp", "r" ) )
      {
        fseek( uf, ttyslot() * sizeof( ut ), 0 );
        fread( &ut, sizeof( ut ), 1, uf );
        fclose( uf );
        strcpy( tty, ut.ut_host );
        tty[16] = '\0';
      }
      /* output a message to the log file */
      fprintf( f, "%s login by %s (%s) from %s\n", buf,  ent->pw_name, ent->pw_gecos, tty );
    }
    else
      fprif( f, "%s unknown\n", buf );

    fclose( f );
  }

  /* message to the user */
  /* edit as appriopriate */
  printf( "\n\n\007\007\007Esta cuenta ha sido deshabilitada.\nPor favor comuniquese con el administrador del sistema.\n\n");

  /* give him time to read it */
  sleep( 30 );
  exit( 0 );
}
