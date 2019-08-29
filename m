Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE7CA1036
	for <lists+squashfs-devel@lfdr.de>; Thu, 29 Aug 2019 06:13:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1i3Bon-00054y-CL; Thu, 29 Aug 2019 04:13:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <phillip.lougher@gmail.com>)
 id 1i3Bom-00054i-Bq; Thu, 29 Aug 2019 04:13:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:Subject:Message-ID:Date:From:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CGB9Bl00N7Lgxzrk7tZ5l5gvqjuiS0y44pMFujY10BE=; b=S1OPolL9BJvPqUUySYF9eeEioL
 T/mmkmgOv5DxdE/qKB3C4c1FK8Dr6nPtojwnp799ifXb/pk/Bbp1tLLD/KHv3fb+zdaYb0xgmRgW8
 AnAbPNx9Cpd7WBX90SiDBM2vuSMB+AMMCB5bU3vJiYwBdCWtSSwx/CnpZPp0pRVm1bNM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:Subject:Message-ID:Date:From:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=CGB9Bl00N7Lgxzrk7tZ5l5gvqjuiS0y44pMFujY10BE=; b=E
 T3Q0ZXzltI6ojb1Ido03QB6OBtFptiXPzHroJGlSU/obrEW8InI2ZJNj9YF6PG1lV6HVKUGdc4XJe
 wF4OqScIAmcIm/IUlT2M1dwXutZFv4U2fdHHTGLM6Bp8FTYqNQnPTiaPZb3FTgbACad3cKKEH1PEn
 mCEWkmhm+gn0DLd8=;
Received: from mail-lf1-f67.google.com ([209.85.167.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1i3Bok-007Mgr-Hk; Thu, 29 Aug 2019 04:13:52 +0000
Received: by mail-lf1-f67.google.com with SMTP id r5so1374860lfc.3;
 Wed, 28 Aug 2019 21:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CGB9Bl00N7Lgxzrk7tZ5l5gvqjuiS0y44pMFujY10BE=;
 b=nRrO+m04lHsl1DTdbrtvUz7I12s8nDdNosAQiknWz++kqubdfKDlZolq/4RqYERhlM
 5p557h4o90u2YlWMnHIvJUz4sDsedZp7utboXFN+Bhk7pdH/LqEKQ0cebWzeD3C3F9VJ
 JFTApcjnCPJd8yZd+DIrltdspUY2Vc4vS+OSO+Hbc/1J8CWMg5PVA4fptK2FoVyOkB9k
 S3oy7aFt5Sd9pa/XsczoCaOUVnZsFFZV5TFP4rzw2j4q2grP2xxnW/jQXT47Y9O7Q3S+
 38qNH1CyWcAQ6aOCPuDJwL5CXoNnrhI0kFH1KqQmTEpop2juUvkorRlORRr/OStMrdnc
 WMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CGB9Bl00N7Lgxzrk7tZ5l5gvqjuiS0y44pMFujY10BE=;
 b=VyDmVdjlpSLdUkcPwG0kuLIvR+n5s3DDI8HdMDSmoW9OlwXSwZ+B0yiOtnvG7TWbYP
 D0M09Y9URbpkF8HKDENX/xscuYXNVfcercqEe6MYJEfiZ5cksZema4l0yiE5pZHaROUx
 Cj5kuu4Piq47kVbfkCmmj72QzPE6gJyrtIbX1bbdYcRxie9O8WAnhEYCVyGcQnh4rtqL
 IUM3bnd1roghkXl411InMOkwi5CMfgiYfiFDDgzH3Wj96+JN9fTUs2kXaFjqKGXJRqkN
 fOxM+noJ/pfjHDom21gJLEPA4lahX05kxtXVtYv4WQPumPvb0/tHry8j7HwxHb1Cd/HX
 xxOw==
X-Gm-Message-State: APjAAAUbJoZ2M6gs8K7jJ22Ju2PkhJ9vnNbAhr9S0tPBB9GXuOrsT/6I
 /vdzkcHIaqc2XuiysbqiqTxoR4w8Cinmrx08OpfGT4AHwbY=
X-Google-Smtp-Source: APXvYqzCeN+JeJ9MdShplFWIbe84ol/paCNmXRB0kcGPhRsEEyf8eZOP0DfoYUfTiKvgxMYj5HIr4r1a2nQb0b0kPxQ=
X-Received: by 2002:a05:6512:304:: with SMTP id
 t4mr4956974lfp.15.1567052023335; 
 Wed, 28 Aug 2019 21:13:43 -0700 (PDT)
MIME-Version: 1.0
From: Phillip Lougher <phillip.lougher@gmail.com>
Date: Thu, 29 Aug 2019 05:13:32 +0100
Message-ID: <CAB3wodcJ2BK9saAw-agJEeZbXhKHSfEdwTxTiQi8wNfoSWFhWw@mail.gmail.com>
To: squashfs-announce@lists.sourceforge.net, 
 SquashFS developers <squashfs-devel@lists.sourceforge.net>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (phillip.lougher[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: reproducible-builds.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1i3Bok-007Mgr-Hk
Subject: [Squashfs-devel] [ANN] Squashfs tools 4.4 released
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

I'm pleased to announce the release of Squashfs tools 4.4.
This is the first release in over 5 years, and there are
substantial improvements: reproducible builds, new compressors,
CVE fixes, security hardening and new options for
Mksquashfs/Unsquashfs.

The new release can be downloaded here:
http://sourceforge.net/projects/squashfs/files/latest/download?source=files

Summary of changes in Squashfs tools 4.4
----------------------------------------

1. Mksquashfs now generates reproducible images by default.  Mkfs time and
   file timestamps can also be specified.

2. Support for the Zstandard (ZSTD) compression algorithm has been added.

3. Pseudo files now support symbolic links.

4. CVE-2015-4645 and CVE-2015-4646 have been fixed.

5. Unsquashfs has been further hardened against corrupted filestems.

6. Unsquashfs is now more strict about error handling.

7. Miscellaneous new options and major bug fixes for Mksquashfs.

8. Miscellaneous new options and major bug fixes for Unsquashfs.

9. Squashfs-tools 4.4 is compatible with all earlier 4.x filesystems
   and releases.


1. Introducing reproducible builds
----------------------------------

Ever since Mksquashfs was parallelised back in 2006, there
has been a certain randomness in how fragments and multi-block
files are ordered in the output filesystem even if the input
remains the same.

This is because the multiple parallel threads can be scheduled
differently between Mksquashfs runs.  For example, the thread
given fragment 10 to compress may finish before the thread
given fragment 9 to compress on one run (writing fragment 10
to the output filesystem before fragment 9), but, on the next
run it could be vice-versa.  There are many different scheduling
scenarios here, all of which can have a knock on effect causing
different scheduling and ordering later in the filesystem too.

Mkquashfs doesn't care about the ordering of fragments and
multi-block files within the filesystem, as this does not
affect the correctness of the filesystem.

In fact not caring about the ordering, as it doesn't matter, allows
Mksquashfs to run as fast as possible, maximising CPU and I/O
performance.

But, in the last couple of years, Squashfs has become used in
scenarios (cloud etc) where this randomness is causing problems.
Specifically this appears to be where downloaders, installers etc.
try to work out the differences between Squashfs filesystem
updates to minimise the amount of data that needs to transferred
to update an image.

Additionally, in the last couple of years has arisen the notion
of reproducible builds, that is the same source and build
environment etc should be able to (re-)generate identical
output.  This is usually for verification and security, allowing
binaries/distributions to be checked for malicious activity.
See https://reproducible-builds.org/ for more information.

Mksquashfs now generates reproducible images by default.
Images generated by Mksquashfs will be ordered identically to
previous runs if the same input has been supplied, and the
same options used.

1.1.1 Dealing with timestamps

Timestamps embedded in the filesystem will stiil cause differences.
Each new run of Mksquashfs will produce a different mkfs (make filesystem)
timestamp in the super-block.  Moreover if any file timestamps have changed
(even if the content hasn't), this will produce a difference.

To prevent timestamps from producing differences, the following
new Mksquashfs options have been added.

1.1.2 -mkfs-time <time>

This option takes a positive time value (which is the number
of seconds since the epoch of 1970-01-01 00:00:00 UTC), and sets
the file system timestamp to that.

Squashfs uses an unsigned 32-bit integer to store time, and the
time given should be in that range.

Obviously you can use the date command to convert dates into
this value, i.e.

% mksquashfs source source.sqsh -mkfs-time $(date +%s -d "Jan 1 2019 19:00")

1.1.3 -all-time <time>

This option takes a positive time value (which is the number
of seconds since the epoch of 1970-01-01 00:00:00 UTC), and sets
the timestamp on all files to that (but not the mkfs time).

1.1.4 environment variable SOURCE_DATE_EPOCH

As an alternative to the above command line options, you can
set the environment variable SOURCE_DATE_EPOCH to a time value.

This value will be used to set the mkfs time.  Also any
file timestamps which are after SOURCE_DATE_EPOCH will be
clamped to SOURCE_DATE_EPOCH.

See https://reproducible-builds.org/docs/source-date-epoch/
for more information.

Note: both SOURCE_DATE_EPOCH and the command line options cannot
be used at the same time.  They are different ways to do the same thing,
and both have FORCE sematics which mean they can't be over-ridden
elsewhere (otherwise it would defeat the purpose).

1.1.5 -not-reproducible

This option tells Mksquashfs that the files do not have to be
strictly ordered.  This will make Mksquashfs behave like version 4.3.


2. Zstandard (ZSTD) compression added
-------------------------------------

This is named zstd.  It supports the following
compression options.

    zstd
      -Xcompression-level <compression-level>
        <compression-level> should be 1 .. 22 (default 15)


3. Pseudo file symbolic link support added
------------------------------------------

Pseudo definition

Filename s mode uid gid symlink

uid and gid can be either specified as a decimal number, or by name.

Note mode is ignored, as symlinks always have "rwxrwxrwx" permissions.

For example:

symlink s 0 root root example

creates a symlink "symlink" to file "example" with root uid/gid.


4. CVE-2015-2015-4645 and CVE-2015-4646
---------------------------------------

These CVEs were raised due to Unsquashfs having variable overflow and
stack overflow in a number of vulnerable functions.

All instances of variable overflow and stack overflow have been
removed.


5. Unsquashfs hardened against corrupted filestems
--------------------------------------------------

The filesystem super-block values and filesystem metadata tables
are further sanity checked.  More importantly, these values are now
checked for validity against other values in the metadata tables, and
these values must match.


6. Unsquashfs is now more strict about error handling
-----------------------------------------------------

Unsquashfs splits errors into two categories: fatal errors and non-fatal
errors.  In this release a significant number of errors that were previously
non-fatal have been hardened to fatal.

Fatal errors are those which cause Unsquashfs to abort instantly.
These are generally due to failure to read the filesystem (corruption),
and/or failure to write files to the output filesystem, due to I/O error
or out of space.  Generally anything which is unexpected is a fatal error.

Non-fatal errors are generally where support is lacking in the
output filesystem, and it can be considered to be an expected failure.
This includes the inability to write extended attributes (xattrs) to
a filesystem that doesn't support them, the inability to create files on
filesystem that doesn't support them (i.e. symbolic links on VFAT), and the
inability to execute privileged operations as a user-process.

The user may well know the filesystem cannot support certain operations
and would prefer Unsquashfs to ignore then without aborting.

Two new options have been added:

6.1. -ignore-errors

This makes Unsquashfs behave like previous versions, and treats more
errors as non-fatal.

6.2. -strict-errors

This makes Unsquashfs treat every error as fatal, and it will abort
instantly.


7. Miscellaneous new options and major bug fixes for Mksquashfs
---------------------------------------------------------------

7.1. -root-mode <mode>

This sets the permissions of the root directory to the octal <mode>.
This is mostly intended for when multiple sources are specified on
the command line.  In this instance Mksquashfs produces a dummy top level
directory with permissions 0777 (rwxrwxrwx).  This option allows the
permissions to be changed.  But the option can also be used when a single
source is specified.

7.2. -quiet

This suppresses all output from Mksquashfs, except the progress bar.

The progress bar can disabled with -no-progress to produce completely
silent output.

This new option is useful for scripts.

7.3. -noId

This is similar to the pre-existing -noI option, except, it specifies that
only the Id table (uids and gids) should be uncompressed.  This option was
added to enable a use-case where uids and gids need to be updated after
filesystem generation.

7.4. -offset <offset>

This option skips <offset> bytes at the beginning of the output filesystem.

Optionally a suffix of K, M or G can be given to specify Kbytes, Mbytes or
Gbytes respectively.

7.5. Update lz4 wrapper to use new functions introduced in 1.7.0

7.5. Bug fix, don't allow "/" pseudo filenames

7.6. Bug fix, allow quoting of pseudo files, to better handle filenames with
     spaces

7.7. Fix compilation with glibc 2.25+


8. Miscellaneous new options and major bug fixes for Unsquashfs
---------------------------------------------------------------

8.1. -lln[umeric]

This is similar to the "-lls" option but displays uids and gids numerically.

8.2. -lc option

This is similar to the "-ls" option except it only displays files and empty
directories.

8.3. -llc option

As "-llc" option but displays file attributes.

8.4. -offset <offset>

This option skips <offset> bytes at the beginning of the input filesystem.

Optionally a suffix of K, M or G can be given to specify Kbytes, Mbytes or
Gbytes respectively.

8.5. -quiet

This suppresses all output from Unsquashfs, except the progress bar.

The progress bar can disabled with -no-progress to produce completely
silent output.

This new option is useful for scripts.

8.6. -UTC

This option makes Unsquashfs display all times in the UTC time zone rather
than using the default local time zone.

8.7. Update lz4 wrapper to use new functions introduced in 1.7.0

8.8. Bug fix, fatal and non-fatal errors now set the exit code to 1

8.9. Bug fix, fix time setting for symlinks

8.10. Bug fix, try to set sticky-bit when running as a user process

8.11. Fix compilation with glibc 2.25+


9. Compatiblity
---------------

Mksquashfs 4.4 generates 4.0 filesystems.  These filesystems are fully
compatible/interchangable with filesystems generated by Mksquashfs 4.x and are
mountable on 2.6.29 and later kernels.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
