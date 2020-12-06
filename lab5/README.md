<h1>Лабораторная работа №5. Управление памятью в ОС Linux</h1>
<h2>Начальная конфигурация системы:</h2>
<ul>
    <li>MemTotal: 1870900 kB </li>
    <li>SwapTotal: 839676 kB</li>
    <li>PageSize: 4096 B</li>
    <li>MemFree: 1430572 kB</li>
    <li>SwapFree: 839676 kB</li>
</ul>
*Данные получены при помощи скрипта <a href="find_starting_config">find_starting_config</a>
<h2>Эксперимент №1 </h2>
<h3>Первый этап</h3>
<p>Скрипт: <a href="first%20experiment%20step1/scripts/mem.bash">mem.bash</a></p>
<p>Журнал при первом запуске <a href="first%20experiment%20step1/scripts/mem.bash">mem.bash</a>:</p>
<p><i>[475.033362] Out of memory: Killed process 1461 (mem.bash) total-vm: 2666336 kB, anon-rss: 1666652 kB, file-res: 0 kB, shmem-rss: 0 kB, UID: 1000</i></p>
<p><i>[475.123110] oom_reaper: reaped process 1461 (mem.bash), now anon-rss: 0 kB, file-rss: 0 kB, shmem-rss: 0 kB</i></p>
<p>Последняя строка report.log: 30000000</p>

<p>Скрипт: <a href="first%20experiment%20step1/scripts/mem.bash">mem.bash</a></p>
<p>Скрипт слежения: <a href="first%20experiment%20step1/scripts/watch1.bash">watch1.bash</a></p>
<p>Скрипт запуска: <a href="first%20experiment%20step1/scripts/runmem.bash">runmem.bash</a></p>
<p>Журнал при втором запуске <a href="first%20experiment%20step1/scripts/mem.bash">mem.bash</a>:</p>
<p><i>[475.033362] [13012.346425] Out of memory: Killed process 90888 (mem.bash) total-vm:2637032 kB, anon-rss: 1678956 kB, file-rss: 0 kB, UID: 1000</i></p>
<p><i>[13012.433542] oom_reaper: reaped process 90888 (mem.bash), now anon-rss: 0 kB, file-rss 0 kB, shmem-rss: 0 kB</i></p>
<p>Последняя строка report.log: 30000000</p>

<h4>График изменения свободной памяти физической памяти и памяти раздела подкачки относительно времени</h4>
<img src="https://github.com/Barabasheks/OS/blob/master/lab5/graphs/exp1_step1.png">

<h4>Выводы</h4>
<p>В начале программа занимает только физическую память. Как можно увидеть по графику, свободная физическая память линейно убывает, а размер свободной памяти раздела подкачки остается постоянным. Однако в определенный момент времени (42-43с) свободная физическая память заканчивается, и начинается использование раздела подкачки. Когда же заканчивается и он, программа аварийно завершается.
</p>
<p>Размер массива в момент аварийного завершения программы: 3*10^7 </p>
<h3>Второй этап</h3>
<p>Первый скрипт: <a href="first%20experiment%20step2/scripts/mem.bash">mem.bash</a></p>
<ul>
    <li>Скрипт слежения: <a href="first%20experiment%20step2/scripts/watch1.bash">watch1.bash</a></li>
    <li>Файл вывода: <a href="first%20experiment%20step2/results/report.log">report.log</a></li>
    <li>Файл отслеживания памяти: <a href="first%20experiment%20step2/results/mem1.txt">mem1.txt</a></li>
    <li>Файл отслеживания памяти раздела подкачки (Swap): <a href="first%20experiment%20step2/results/swap1.txt">swap1.txt</a></li>
    <li>Файл отслеживания первых пяти процессов top: <a href="first%20experiment%20step2/results/first_five1.txt">first_five1.txt</a></li>
    <li>Файл отслеживания параметров процесса mem.bash: <a href="first%20experiment%20step2/results/proc_membash1.txt">proc_membash1.txt</a></li>
</ul>
<p>Второй скрипт: <a href="first%20experiment%20step2/scripts/mem2.bash">mem2.bash</a></p>
<ul>
    <li>Скрипт слежения: <a href="first%20experiment%20step2/scripts/watch2.bash">watch2.bash</a></li>
    <li>Файл вывода: <a href="first%20experiment%20step2/results/report2.log">report2.log</a></li>
    <li>Файл отслеживания памяти: <a href="first%20experiment%20step2/results/mem2.txt">mem2.txt</a></li>
    <li>Файл отслеживания памяти раздела подкачки (Swap): <a href="first%20experiment%20step2/results/swap2.txt">swap2.txt</a></li>
    <li>Файл отслеживания первых пяти процессов top: <a href="first%20experiment%20step2/results/first_five2.txt">first_five2.txt</a></li>
    <li>Файл отслеживания параметров процесса mem.bash: <a href="first%20experiment%20step2/results/proc_membash2.txt">proc_membash2.txt</a></li>
</ul>
<p><b>Скрипт совместного запуска: <a href="first%20experiment%20step2/scripts/run_two_mems.bash">run_two_mems.bash</a></b></p>

<p>Журнал:</p>
<p><i>[18328.475820] Out of memory: Killed process 93615 (mem.bash) total-vm: 1432664 kB, anon-rss: 825744 kB, file-rss: 4 kB, shmem-rss: 0 kB, UID: 1000</i></p>
<p><i>[18328.549235] oom_reaper: reaped process 93615 (mem.bash), now anon-rss: 0 kB, file-rss 0 kB, shmem-rss: 0 kB</i></p>

<p><i>[18367.133144] Out of memory: Killed process 93616 (mem2.bash) total-vm: 2622776 kB, anon-rss: 1664724 kB, file-rss: 0 kB, shmem-rss: 0 kB, UID: 1000</i></p>
<p><i>[18367.231586] oom_reaper: reaped process 93616 (mem2.bash), now anon-rss: 0 kB, file-rss 0 kB, shmem-rss: 0 kB</i></p>
<p>Последняя строка report.log: 15000000</p>
<p>Последняя строка report2.log: 30000000</p>

<h4>График изменения свободной памяти физической памяти и памяти раздела подкачки относительно времени</h4>
<img src="https://github.com/Barabasheks/OS/blob/master/lab5/graphs/exp1_step2.png">

<h4>Выводы</h4>
<p>Во втором случае сначала происходит полностью аналогичная ситуации с первым случаем, однако аварийно завершается только одна из программ (на 33-32с). После чего происходит резкий рост свободной физической памяти и памяти раздела подкачки (можно увижеть этот момент на графиках с 33 по 35 секунды). Затем физическая память вновь линейно убвает, а память раздела подкачки пока остается не изменной. После, когда физическая память заканчивается, начинает также убывать память раздела подкачки, пока программа не завершитсяя аварийно по ее истечению.</p>
<p>Размеры массивов в момент аварийного завершения первой программы 15*10^6 и 15*10^6. Это легко объясняется тем, конфигурация системы не менялась, и мы имеем равный ограниченный объем памяти в обеих случаях. То есть максимальная сумма размеров массивов обязательно должна быть равна максимальному размеру массива из первого случая. А так как оба процесса имели равный приоритет, и были запущено практически одновременно, то их размеры и должны быть равны. </p>
<p>После завершения работы одной из программ, память освобождается, и второй массив можно дополнительно заполнить на число элементов первого массива (15*10^6). Поэтому максимальный размер второго массива 3*10^7</p>

<h2>Эксперимент №2</h2>
<p>Скрипт: <a href="second%20experiment/newmem.bash">newmem.bash</a></p>
<p>Скрипт запуска: <a href="second%20experiment/run_newmem.bash">run_newmem.bash</a></p>

<h4>Выводы</h4>
<p>При K = 10 все процессы завершаются нормально.</p>
<p>При K = 30 часть процессов завершается аварийно. Это происходит вследствии нехватки памяти. Как известно из предыдущего эксперимента максимальная сумма хранимых элементов массивов 3*10^7, однако мы создаем 30 процессов с 3*10^6-размерным массивом. И в какой-то момент суммарное число элементов всех массивов превысит 3*10^7, что приведет к аварийному завершению ряда процессов.</p>
<p>Методом подбора удалось определить максимальное N для K = 30, при котором ни один процесс не завершается аварийно. Максимальное N = 1770000</p>
<p>Можно подумать, что при данном N в какой-то момент будет храниться в памяти 30*N = 531*10^5, что на первый взгляд является противоречием (ведь максимальная сумма размеров массивов не должна превышать 3*10^7). Однако это объясняется тем, что мы запускаем процессы через секунду, а значит самые первые процессы успеют отработать, завершиться и освободить память для будущих процессов.</p>
