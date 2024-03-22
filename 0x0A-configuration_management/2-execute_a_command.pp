# kills a reunning server program

exec { 'kill_killmenow':
  command =>  'pkill -9 killmenow',
  path    =>  ['/usr/bin/'],
}