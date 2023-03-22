Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A536C423A
	for <lists+squashfs-devel@lfdr.de>; Wed, 22 Mar 2023 06:40:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1perCQ-0002zL-Cx;
	Wed, 22 Mar 2023 05:39:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1perCN-0002zE-Ux
 for squashfs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 05:39:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qbVJ8+wKlqzUM6OHyP4DT1R9BlPqwCniGekJWPGB+xw=; b=JnuTeHGUNT6gmKmBQ/OkuRqK1O
 UUcKB++mlNSn0yzYUTUwamXiHBrNL//uaeh8jUG2PHthz9GciNgmgZ9ShuJdEx9pseDWzN26vBzr7
 hbP8CxZiB7PUrqtgBT+vVl8r71gayL7tcArMrIlFsEV49cyM+jI2XEW1vuWi2gG7lEZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qbVJ8+wKlqzUM6OHyP4DT1R9BlPqwCniGekJWPGB+xw=; b=l
 lyzISHJIrZUvzgB4ibtaYn8uw6dQWnjp7DxTL0jRTXceY5DKD1pvrraguE2bZwK5aw9pORQeNCSiU
 IpV/xqHVfkI/M0WHYTIByBC1JQDIDQz4rLwszfh7g6fKJSaeEOepQjWdh3IYYYRixs/Rc1F4Lhp2/
 eVqspNH7IJmR8Wr0=;
Received: from p3plsmtp26-04-2.prod.phx3.secureserver.net ([216.69.139.30]
 helo=p3plwbeout26-04.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1perCP-00GFMw-4q for squashfs-devel@lists.sourceforge.net;
 Wed, 22 Mar 2023 05:39:49 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id eqtXpcLuQJzPreqtXp8nzP; Tue, 21 Mar 2023 22:20:20 -0700
X-CMAE-Analysis: v=2.4 cv=OJjiYQWB c=1 sm=1 tr=0 ts=641a9014
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=k__wU0fu6RkA:10 a=FP58Ms26AAAA:8 a=NEAV23lmAAAA:8
 a=dnHKQ0aXFSJ-3baA9N4A:9 a=jGIlq7wQ_eTbAL2R:21
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: eqtXpcLuQJzPr
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=phoenix.fritz.box)
 by smtp11.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1peqtW-0004WB-LA; Wed, 22 Mar 2023 05:20:19 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 squashfs-devel@lists.sourceforge.net
Date: Wed, 22 Mar 2023 05:26:15 +0000
Message-Id: <20230322052615.28048-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfMPCzaJF8Ipm2fZlBomGzdaRNYxkjIyUzpXS504TZry5qBJ6DnXYKPApL0xS01flhnlmyIxv79L01ztfsUZVcKsOKnh4G1H+qNSZwPAg6UzUQ1HOBL0g
 qccOrqmytk/vzTgXx9prF2LyB6Bx3LmjReKk4OuFp7oBtaoX442wqHpVwSC+FsYDgc8HCOD4CPReYzJIdk+Tjej/cJ+UZEEv5IEvQSukm3jH22JFXdpOvmVK
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, I'm pleased to announce the release of Squashfs tools
 4.6. The release can be downloaded either from Sourceforge, or GitHub. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.30 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
X-Headers-End: 1perCP-00GFMw-4q
Subject: [Squashfs-devel] [ANN] Squashfs-tools 4.6 released
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

I'm pleased to announce the release of Squashfs tools 4.6.

The release can be downloaded either from Sourceforge, or GitHub.

https://sourceforge.net/projects/squashfs/files/latest/download

https://github.com/plougher/squashfs-tools/archive/refs/tags/4.6.tar.gz

A summary of the changes is below.  Please see the README-4.6 file in
the release tarball for more information and the USAGE files.

Phillip

1. Summary of changes
---------------------

1. Extended attribute handling improved in Mksquashfs and Sqfstar

	1.1.New -xattrs-exclude option to exclude extended attributes from files
	    using a regular expression.
	1.2 New -xattrs-include option to include extended attributes from files
	    using a regular expression.
	1.3 New -xattrs-add option to add extended attributes to files.
	1.4 New Pseudo file xattr definition to add extended attributes to
	    files.
	1.5 New xattrs-add Action to add extended attributes to files
	    (Mksquashfs only).

2. Extended attribute handling improved in Unsquashfs

	2.1 New -xattrs-exclude option to exclude extended attributes from files
	    using a regular expression.
	2.2 New -xattrs-include option to include extended attributes from files
	     using a regular expression.
	2.3 Extended attributes are now supported in Pseudo file output.

3. Other major improvements

	3.1 Unsquashfs can now output Pseudo files to standard out.
	3.2 Mksquashfs can now input Pseudo files from standard in.
	3.3 Squashfs filesystems can now be converted (different block size
	    compression etc) without unpacking to an intermediate filesystem or
	    mounting, by piping the output of Unsquashfs to Mksquashfs.
	3.4 Pseudo files are now supported by Sqfstar.
	3.5 "Non-anchored" excludes are now supported by Unsquashfs.

4. Mksquashfs minor improvements

	4.1 A new -max-depth option has been added, which limits the depth
	    Mksquashfs descends when creating the filesystem.
	4.2 A new -mem-percent option which allows memory for caches to be
	    specified as a percentage of physical RAM, rather than requiring an
	    absolute value.
	4.3 A new -percentage option added which rather than generating the full
	    progress-bar instead outputs a percentage.  This can be used with
	    dialog --gauge etc.
	4.4 -mkfs-time, -all-time and -root-time options now take a human date
	    string, in addition to the seconds since the epoch of 1970 00:00
	    UTC.  For example "now", "last week", "Wed Mar 8 05:55:01 GMT 2023"
	    are supported.
	4.5 -root-uid, -root-gid, -force-uid and -force-gid options now take a
	    user/group name in addition to the integer uid/gid.
	4.6 A new -mem-default option which displays default memory usage for
	    caches in Mbytes.
	4.7 A new -no-compression option which produces no compression, and it
	    is a short-cut for -noI, -noD, -noF and -noX.
	4.8 A new -pseudo-override option which makes pseudo file uids and gids
	    override -all-root, -force-uid and -force-gid options.  Normally
	    these options take precedence.

5. Unsquashfs minor improvements

	5.1 New -all-time option which sets all file timestamps to <time>,
	    rather than the time stored in the filesystem inode.  <time> can be
	    an integer indicating seconds since the epoch (1970-01-01) or a
	    human string value such as "now", "last week", or
	    "Wed Feb 15 21:02:39 GMT 2023".
	5.2 New -full-precision option which uses full precision when displaying
	    times including seconds.  Use with -linfo, -lls, -lln and -llc
	    options.
	5.3 New -match option where Unsquashfs will abort if any extract file
	    does not match on anything, and can not be resolved.
	5.4 New -percentage option added which rather than generating the full
	    progress-bar instead outputs a percentage.  This can be used with
	    dialog --gauge etc.

6. Sqfstar minor improvements

	6.1 New -ignore-zeros option added which allows tar files to be
	    concatenated together and fed to Sqfstar.  Normally a tarfile has
	    two consecutive 512 byte blocks filled with zeros which means EOF
	    and Sqfstar will stop reading after the first tar file on
	    encountering them. This option makes Sqfstar ignore the zero filled
	    blocks.
	6.2 A new -mem-percent option which allows memory for caches to be
	    specified as a percentage of physical RAM, rather than requiring an
	    absolute value.
	6.3 A new -percentage option added which rather than generating the full
	    progress-bar instead outputs a percentage.  This can be used with
	    dialog --gauge etc.
	6.4 -mkfs-time, -all-time and -root-time options now take a human date
	     string, in addition to the seconds since the epoch of 1970 00:00
	     UTC.  For example "now", "last week", "Wed Mar 8 05:55:01 GMT 2023"
	     are supported.
	6.5 -root-uid, -root-gid, -force-uid and -force-gid options now take a
	     user/group name in addition to the integer uid/gid.
	6.6 A new -mem-default option which displays default memory usage for
	    caches in Mbytes.
	6.7 A new -no-compression option which produces no compression, and it
	    is a short-cut for -noI, -noD, -noF and -noX.
	6.8 A new -pseudo-override option which makes pseudo file uids and gids
	    override -all-root, -force-uid and -force-gid options.  Normally
	    these options take precedence.
	6.9 Do not abort if ZERO filled blocks indicating end of the TAR archive
	    are missing.

7. Other minor improvements

	7.1 If Mksquashfs/Unsquashfs fails to execute generating the manpages
	    because they have been cross-compiled, fall back to using the
	    pre-built manpages.
	7.2 Add new Makefile configure option USE_PREBUILT_MANPAGES to always
	    use pre-built manpages rather than generating them when "make
	    install" is run.

8. Major bug fixes

	8.1 Following a symlink in Sqfscat or where -follow-symlinks option is
	    given with Unsquashfs, incorrectly triggered the corrupted
	    filesystem loop detection code.
	8.2 In Unsquashfs if a file was not writable it could not add extended
	    attributes to it.
	8.3 Sqfstar would incorrectly reject compressor specific options that
	    have an argument.
	8.4 Sqfstar would incorrectly strip pathname components in PAX header
	    linkpath if symbolic.
	8.5 Sqfstar -root-uid, -root-gid and -root-time options were documented
	    but not implemented.
	8.6 Mksquashfs -one-file-system option would not create empty mount
	    point directory when filesystem boundary crossed.
	8.7 Mksquashfs did not check the close() return result.


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
