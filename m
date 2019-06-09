Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 435DC3A2CF
	for <lists+squashfs-devel@lfdr.de>; Sun,  9 Jun 2019 03:49:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1hZmx5-0000ah-SN; Sun, 09 Jun 2019 01:48:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <goliath@infraroot.at>)
 id 1hZmx4-0000aQ-32; Sun, 09 Jun 2019 01:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Date:Message-ID:Cc:Subject:From:To:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/fRwe2GcLzUxySmHLICGKT6/dOFUnGCwfq7raiN3HB8=; b=MnIJfZctf2aY2nWdO1ZWpQ5r99
 YxsIsuUNLUQZNr0S8BO006hGC+0af8oWkqD0QGcPyWZ3ykRItz9pUYEdQ3LrJJ28Vd4Fu7A+0BBHJ
 MhHGrSLWMVbj3RXNHgpTRIYiT51DIMHouKd14kFNH5rc0STQoCBRXxD5ekbcgFevlQyE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-ID:Cc:
 Subject:From:To:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/fRwe2GcLzUxySmHLICGKT6/dOFUnGCwfq7raiN3HB8=; b=S
 zaRhpmYPwcmXJYPIiU8XaZqkzTGOJdeinj7Fqk7mTCA942qJxup7uzNg3xXiXsjaBWUK2PI1l3oHx
 xV+H3XGxH5tueUSeneboNXp8O06J7IzvNAMi1cKhLS4JKqLLR5bjd5wMhuKKDdBTxUdpRgkbGMcF1
 EbHwwVUxOnrPtnzM=;
Received: from mail.infraroot.at ([54.37.73.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hZmx1-00D2qT-JW; Sun, 09 Jun 2019 01:48:54 +0000
Received: from [192.168.178.20] (clnet-p04-043.ikbnet.co.at [83.175.81.43])
 by mail.infraroot.at (Postfix) with ESMTPSA id 7F6283F603;
 Sun,  9 Jun 2019 03:34:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.infraroot.at 7F6283F603
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infraroot.at;
 s=default; t=1560044042;
 bh=/fRwe2GcLzUxySmHLICGKT6/dOFUnGCwfq7raiN3HB8=;
 h=To:From:Subject:Cc:Date:From;
 b=RM6XkwdHFzzymelQQKaYghvgl9Ofrc8A31wHge7j6dpk54eYENhPhD4GnOpFCjZeS
 ixUaQHLfFr6zoXZp7NeX7XoMG/0kHtpWyaEUHKN+4g6/RJxKw4XgGALtcWEMXeA2La
 3+rAFVrKKxBRXkpKg4AJ2i7V2/xve4fNorZ4iVC0=
To: squashfs-devel@lists.sourceforge.net
From: Goliath <goliath@infraroot.at>
Message-ID: <c6a517ac-05f3-91ec-8906-ce8651be5095@infraroot.at>
Date: Sun, 9 Jun 2019 03:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hZmx1-00D2qT-JW
Subject: [Squashfs-devel] [ANNOUNCE] squashfs-tools-ng 0.1
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
Cc: squashfs-announce@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

Hi,

after running into a bunch of limitations with the existing tools, I took
the liberty of piecing together a new squashfs packer and extractor that
intend to be feature wise compatible with the existing ones, but with a
few important improvements, such as:

 - Tooling inspired to `gen_init_cpio` from the kernel
   - Easy micro management of the file system structure
   - Precise control of permissions and ownership
   - Allows non-root users to easily build images with e.g. SUID binaries
     and device special files
 - SELinux support through SELinux context files (see selabel_file(5))
 - Deterministic, reproducible image generation


My initial plan was to integrate this into upstream squashfs-tools, but
upstream development appears to be pretty stale and the code base itself
is actually in a fairly messy state, so I started afresh.

The programs in the package have been specifically named to not clash with
the existing tools, so they can be installed and used side by side.

For the time being, I published the git tree on GitHub. A link to a release
tarball can also be found below.

I only did some basic testing so far with a few variations of root file systems
that I could boot from in Qemu and on some embedded boards I have sitting
around.

Any feedback would be welcome.


Release tarball: https://infraroot.at/pub/squashfs/squashfs-tools-ng-0.1.tar.xz

git tree: https://github.com/AgentD/squashfs-tools-ng


Regards,

David


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
