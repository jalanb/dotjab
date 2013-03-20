import sys

from pprint import pprint

def parse_line(line):
	parts = line.split()
	ip, names = parts[0], parts[1:]
	return ip, names


def format_line(ip, names):
	if names is None:
		return str(ip)
	names = sorted(list(names))
	return '%-16s\t%s' % (ip, ' '.join(names))

def read_host_lines(path_to_hosts):
	lines = []
	for line in file(path_to_hosts, 'r'):
		line = line.rstrip()
		if not line or line[0] == '#':
			parsed = (line, None)
		else:
			parts = line.split()
			parsed = parts[0], set(parts[1:])
		lines.append(parsed)
	return lines


def path_to_etc_hosts():
	return '/etc/hosts'


def path_to_jab_hosts():
	return '/home/jab/.jab/etc/hosts'


def read_etc_hosts():
	return read_host_lines(path_to_etc_hosts())


def read_my_hosts():
	return read_host_lines(path_to_jab_hosts())


def _has_names(line):
	ip, names = line
	return names is not None


def ip_dict(lines):
	result = []
	return dict([l for l in lines if _has_names(l)])


def merge_hosts(main, extra):
	extras = ip_dict(extra)
	result = []
	for line in main:
		ip, names = line
		new_line = format_line(ip, names)
		if _has_names(line) and ip in extras:
			extra_names = extras[ip]
			if names.difference(extra_names):
				new_line = format_line(ip, names.union(extra_names))
			del extras[ip]
		result.append(new_line)
	result.append('# Added by %s' % sys.argv[0])
	for ip, names in extras.items():
		result.append(format_line(ip, names))
	return result


def main():
	etc_hosts = read_etc_hosts()
	my_hosts = read_my_hosts()
	lines = merge_hosts(etc_hosts, my_hosts)
	output = file(path_to_etc_hosts(), 'w')
	for line in lines:
		print >> output, line
	output.close()


if __name__ == '__main__':
	main()
