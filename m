Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE789A7D3A9
	for <lists+squashfs-devel@lfdr.de>; Mon,  7 Apr 2025 07:51:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1u1fO1-0006FV-LF;
	Mon, 07 Apr 2025 05:51:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1u1fO0-0006FF-4S
 for squashfs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 05:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0zzjxwe/r75adwpeskOSTyyplfwgVpJNfIpQx1Wc0g=; b=YIsotUM9bR6N3fqdBUM53TZ/tY
 OkNypa5mTKlLoNgDmuTeZ6w2IpmHm3XIqET3heX9V6TYR9/pa/tUG0gk2TMSKIc1X+R7b5mYLtVvW
 OwkmDWqdXEIJ8ust+6YaV+5c+ctK3ighzkWm6ERQG00gOQvTGb6ZvSQ4MUflpKkiF6iQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0zzjxwe/r75adwpeskOSTyyplfwgVpJNfIpQx1Wc0g=; b=cDwxfHr+XIjVVWD7hSscj+9kVg
 EaZMbbcePclRHUvC3wQhLsIA49DK9hd4xsPMLVCT7GBEafmyLEPj2Njmf5OPla8JNZx3B4mn0rO1L
 bZ+jF/50AYgJsFfEjDbLe8QG6ipgm4+97GSw60dH+omavnv++mW8FzlOe4xXZ7UODG+I=;
Received: from sxb1plsmtpa01-04.prod.sxb1.secureserver.net ([92.204.81.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u1fNi-00042V-5x for squashfs-devel@lists.sourceforge.net;
 Mon, 07 Apr 2025 05:51:08 +0000
Received: from [192.168.178.95] ([82.69.79.175]) by :SMTPAUTH: with ESMTPSA
 id 1f4tuKfifINjl1f4vuE9Mb; Sun, 06 Apr 2025 22:31:26 -0700
X-CMAE-Analysis: v=2.4 cv=NI8v+16g c=1 sm=1 tr=0 ts=67f3632f
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=u6sYcmGwt8sEfABpyM8A:9 a=QEXdDO2ut3YA:10
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk>
Date: Mon, 7 Apr 2025 06:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot+65761fc25a137b9c8c6e@syzkaller.appspotmail.com
References: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
Content-Language: en-US
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <67f1f6f6.050a0220.0a13.025a.GAE@google.com>
X-CMAE-Envelope: MS4xfIM042gc/8JGCsd7GfE3sA190hiyYn41HftL2t7HhD8jU/qkoLtCZqDF90lN8wJOcPKl07Wi1+sGAwAQlbTQx3zgpXQL6HqfxJts/adOAEf1qR25kIpU
 NRZXPLUfj1bRszpEsdhBJ4f8Tbg6XRXgZD+Loh62vK/iF6LpL/OprcdFna+L6ByjLqex5N+hPGuWQKcy+9KXvpkRRtiBpZHgVU5il4afUdNzmX9C1Y8julWL
 QiVB8A1CwbaD6WMT6LQYjN1ySrv/ybH3szOl+0bP7ImaglxyiDZ5HWglZ6Mqrn7eI+rBE0LWK8Vg5vffjd6Uf30ihR7tIdmzeATslYypGVNZLVMjYsobUTkJ
 Kwxz52sWqF/i4+AwLLMbxNJl/YhCBzD0sUdpUPkMid1KdPzLg5BZaNiQrD9JroU1irflNFqUwSEwUFCynQW1tbPaV9lZCNY9t8bL520e1E4DkuiKSz00CZrb
 ab3UrmHmEdWRMB4Z81OjagXzJOmCootaFHc26fQx6z8u3kCYUqHyfM80GVg=
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I have spent most of Sunday on this syzbot issue, because
 it is one of those PITAs, which are difficult to reproduce, and are full of
 red herrings. Firstly, this issue has nothing to do with corrupted Squashfs
 filesystems. This is the because the failure occurs before the Squashfs
 filesystem
 superblock has been read, and thus filesystem corruptio [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [92.204.81.42 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [92.204.81.42 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
X-Headers-End: 1u1fNi-00042V-5x
Subject: Re: [Squashfs-devel] [syzbot] [squashfs?] UBSAN:
 shift-out-of-bounds in squashfs_bio_read
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
Cc: squashfs-devel@lists.sourceforge.net, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, squashfs-devel-owner@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

I have spent most of Sunday on this syzbot issue, because it is one of
those PITAs, which are difficult to reproduce, and are full of red
herrings.

Firstly, this issue has nothing to do with corrupted Squashfs
filesystems.  This is the because the failure occurs before the Squashfs
filesystem superblock has been read, and thus filesystem corruption
doesn't come into it.  Thus the source of the failure is elsewhere in
the obfusticated auto-generated C reproducer.

Digging deeper into the reproducer, it turns out the reproducer is
forking multiple processes which after mounting the Squashfs filesystem,
issues a LOOP_SET_BLOCK_SIZE(r0, 0x4c09, 0x8000) ioctl on loopback
device /dev/loop0.  Now, if this ioctl occurs at the same time another
process is in the process of mounting a Squashfs filesystem on
/dev/loop0, the failure occurs.   The ioctl has to be issued in the
early part of squashfs_fill_super() before the superblock has been read.
When this happens, the following code in squashfs_fill_super() fails.

----
msblk->devblksize = sb_min_blocksize(sb, SQUASHFS_DEVBLK_SIZE);
msblk->devblksize_log2 = ffz(~msblk->devblksize);
----

sb_min_blocksize() returns 0, which means msblk->devblksize is set to 0.

As a result, ffz(~msblk->devblksize) returns 64, and
msblk->devblksize_log2 is set to 64.

This subsequently causes the

UBSAN: shift-out-of-bounds in fs/squashfs/block.c:195:36
shift exponent 64 is too large for 64-bit type 'u64' (aka 'unsigned long long')

The fix is to check for a 0 return by sb_min_blocksize().

I'll send a patch tomorrow.

Phillip


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
