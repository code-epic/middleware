package util

import (
	"syscall"
)

const (
	Bd  = 1
	KBd = 1024 * Bd
	MBd = 1024 * KBd
	GBd = 1024 * MBd
)

type EstatusDisco struct {
	Todo  uint64 `json:"toto"`
	Usado uint64 `json:"usado"`
	Libre uint64 `json:"libre"`
}

//DetalleDisco usage of path/disk
func DetalleDisco(path string) (disk EstatusDisco) {
	fs := syscall.Statfs_t{}
	err := syscall.Statfs(path, &fs)
	if err != nil {
		return
	}
	disk.Todo = fs.Blocks * uint64(fs.Bsize)
	disk.Libre = fs.Bfree * uint64(fs.Bsize)
	disk.Usado = disk.Todo - disk.Libre
	return
}

// func DetalleDisco() {
// 	disk := DiskUsage("/")
// 	fmt.Printf("All: %.2f GB\n", float64(disk.All)/float64(GB))
// 	fmt.Printf("Used: %.2f GB\n", float64(disk.Used)/float64(GB))
// 	fmt.Printf("Free: %.2f GB\n", float64(disk.Free)/float64(GB))
// }
