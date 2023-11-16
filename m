Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB9F7EE42F
	for <lists+squashfs-devel@lfdr.de>; Thu, 16 Nov 2023 16:26:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1r3eG0-0003SH-Q0;
	Thu, 16 Nov 2023 15:26:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1r3eG0-0003SB-23
 for squashfs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 15:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BQPhdaYQ1sjxlRQ6PKk/9E+L/5AS7twRpFtjZJR+opk=; b=a8lB9jD8XyneXiqovvX1dzEnS8
 MJ/4AmmZC6E6fvVpNlGZ4EnL2XEx1FleqMnAQ23KlYc4MpSb8nFbmPGZ3/kcCBs2rXXAXR4p0sGEo
 75AQkWFqoNgnKXe2m4n6xXruQjCxpPrRqKRm8nJCmYIxwSvsuL5AfiA4J9LZYpDH35FQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BQPhdaYQ1sjxlRQ6PKk/9E+L/5AS7twRpFtjZJR+opk=; b=YNY6+sG95s/iC3GkzRDNj8CafB
 7W1FUytPIviTtaTHTeHQLY0NrP0eIIC1vkwtcGHLxHcmKOhuAg6GNsEiJNtryfdwjXAtv+asvv8zl
 FjK3rSx5JBmSj1FAKzt+rvRjhroKK9Zxz39bZ4rvnU6fnvP8pYJQaDainOn0/1TSZG9w=;
Received: from p3plsmtp26-02-2.prod.phx3.secureserver.net ([216.69.139.26]
 helo=p3plwbeout26-02.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3eFy-0007z5-HI for squashfs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 15:26:16 +0000
Received: from mailex.mailcore.me ([94.136.40.141]) by :WBEOUT: with ESMTP
 id 3dwtr5SGe0YzM3dwur3Wqy; Thu, 16 Nov 2023 08:06:32 -0700
X-CMAE-Analysis: v=2.4 cv=TZNTCTch c=1 sm=1 tr=0 ts=65562ffa
 a=bheWAUFm1xGnSTQFbH9Kqg==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=BNY50KLci1gA:10 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=FXvPX3liAAAA:8 a=PL5bajTykxBvxVk0eB4A:9 a=AjGcO6oz07-iQ99wixmX:22
 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: 3dwtr5SGe0YzM
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=phoenix.fritz.box)
 by smtp04.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1r3dwt-00087x-95; Thu, 16 Nov 2023 15:06:31 +0000
From: Phillip Lougher <phillip@squashfs.org.uk>
To: eadavis@qq.com
Date: Thu, 16 Nov 2023 15:14:24 +0000
Message-Id: <20231116151424.23597-1-phillip@squashfs.org.uk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <tencent_35864B36740976B766CA3CC936A496AA3609@qq.com>
References: <tencent_35864B36740976B766CA3CC936A496AA3609@qq.com>
MIME-Version: 1.0
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfCdhQzi3TL11+iysU8bjaqxIMtya/Obss5AzNmiPV3Gsj41Ud9KSMX45zueeICx7eqjiAPWurUcuDHkaS2NHXulkE6pP7jI8nWdhKX/7dQLEAAtzeSV+
 MOEZqyaUoDmPoh/pk3qAhDv9Vxfv/GDVlupKPxOgSuaGwtlClWJVhNf3nL4H+ZaJDIVOVDdpelMvvg87633P2J61S1xwOC+AwbNj2n3y/f9AjJxQnwiCn01e
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > [Bug] > path_openat() called open_last_lookups() before
 calling do_open() and > open_last_lookups() will eventually call
 squashfs_read_inode()
 to set > inode->i_size, but before setting i_size, it i [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.26 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r3eFy-0007z5-HI
Subject: Re: [Squashfs-devel] [PATCH] squashfs: fix oob in squashfs_readahead
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
Cc: squashfs-devel@lists.sourceforge.net,
 syzbot+604424eb051c2f696163@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

> [Bug]
> path_openat() called open_last_lookups() before calling do_open() and 
> open_last_lookups() will eventually call squashfs_read_inode() to set 
> inode->i_size, but before setting i_size, it is necessary to obtain file_size 
> from the disk.
> 
> However, during the value retrieval process, the length of the value retrieved
> from the disk was greater than output->length, resulting(-EIO) in the failure of 
> squashfs_read_data(), further leading to i_size has not been initialized, 
> i.e. its value is 0.
> 

NACK

This analysis is completely *wrong*.  First, if there was I/O error reading
the inode it would never be created, and squasfs_readahead() would
never be called on it, because it will never exist.

Second i_size isn't unintialised and it isn't 0 in value.  Where
you got this bogus information from is because in your test patches,
i.e.

https://lore.kernel.org/all/000000000000bb74b9060a14717c@google.com/

You have

+	if (!file_end) {
+		printk("i:%p, is:%d, %s\n", inode, i_size_read(inode), __func__);
+		res = -EINVAL;
+		goto out;
+	}
+

You have used %d, and the result of i_size_read(inode) overflows, giving the
bogus 0 value.

The actual value is 1407374883553280, or 0x5000000000000, which is
too big to fit into an unsigned int.

> This resulted in the failure of squashfs_read_data(), where "SQUASHFS error: 
> Failed to read block 0x6fc: -5" was output in the syz log.
> This also resulted in the failure of squashfs_cache_get(), outputting "SQUASHFS
> error: Unable to read metadata cache entry [6fa]" in the syz log.
> 

NO, *that* is caused by the failure to read some other inodes which
as a result are correctly not created.  Nothing to do with the oops here.

> [Fix]
> Before performing a read ahead operation in squashfs_read_folio() and 
> squashfs_readahead(), check if i_size is not 0 before continuing.
> 

A third NO, it is only 0 because the variable overflowed.

Additionally, let's look at your "fix" here.

> @@ -461,6 +461,11 @@ static int squashfs_read_folio(struct file *file, struct folio *folio)
>  	TRACE("Entered squashfs_readpage, page index %lx, start block %llx\n",
>  				page->index, squashfs_i(inode)->start);
>  
> +	if (!file_end) {
> +		res = -EINVAL;
> +		goto out;
> +	}
> +

file_end is computed by

	int file_end = i_size_read(inode) >> msblk->block_log;

So your "fix" will reject *any* file less than msblk->block_log in
size as invalid, including perfectly valid zero size files (empty
files are valid too).

I already identified the cause and send a fix patch here:

https://lore.kernel.org/all/20231113160901.6444-1-phillip@squashfs.org.uk/

NACK

Phillip


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
