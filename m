Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9A7EEAF1
	for <lists+squashfs-devel@lfdr.de>; Fri, 17 Nov 2023 03:18:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1r3oQh-0004PR-01;
	Fri, 17 Nov 2023 02:17:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1r3oQf-0004PE-Ay
 for squashfs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 02:17:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M2rrF58uX9kKb8/NPGr69oxCMXVAarGvjMsInceZoeg=; b=Lvjo6n78iyA+V4HBlbGa5yUQSi
 lNb4/jIjCnr8s2lObeu5wtZ2rdBWrZN1KrXYZHaW/JS3Z4VqoYWmFgEdA1AaSLutPRiOM8Xj8/yry
 JVDEq7DFV38FypESYb51tReILA1n9PQeYK81YLawVasAr4y5/xs+C93vbh5bo4b78okk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M2rrF58uX9kKb8/NPGr69oxCMXVAarGvjMsInceZoeg=; b=ittWFScvUymluSiZq9Vr7e7XWF
 mlVNgZrUqK/2MmSyaDvCb4sEaHzaHHxu+oXHFknUCqV8hSS3iCkzgtpa23Mo/4jijV4aPiPuLqk+j
 2n2uvRtsOsMHKDz/bLFY5suIOEN6AXAA9zXTJKctHrO6j323u8LxJRmVvb62JbuhfZ0U=;
Received: from p3plsmtp25-04-2.prod.phx3.secureserver.net ([216.69.139.18]
 helo=p3plwbeout25-04.prod.phx3.secureserver.net)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3oQa-007wpL-Aw for squashfs-devel@lists.sourceforge.net;
 Fri, 17 Nov 2023 02:17:55 +0000
Received: from mailex.mailcore.me ([94.136.40.144]) by :WBEOUT: with ESMTP
 id 3oQMrzukmDpIC3oQNrMsQv; Thu, 16 Nov 2023 19:17:39 -0700
X-CMAE-Analysis: v=2.4 cv=Usqmi88B c=1 sm=1 tr=0 ts=6556cd45
 a=wXHyRMViKMYRd//SnbHIqA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=TT3OXX8_H1iH7GK2:21 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=BNY50KLci1gA:10
 a=t7CeM3EgAAAA:8 a=hSkVLCK3AAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8
 a=TlpUs8yM1Nx5ixtUQMgA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
 a=cQPPKAXgyycSBL8etih5:22 a=AjGcO6oz07-iQ99wixmX:22 a=b0R6z3OkPTeaBGj_aaBY:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: 3oQMrzukmDpIC
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.90])
 by smtp06.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1r3oQM-00063O-FT; Fri, 17 Nov 2023 02:17:39 +0000
Message-ID: <748e3619-6569-2f71-7ed1-f67225892e14@squashfs.org.uk>
Date: Fri, 17 Nov 2023 02:17:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: Andrew Morton <akpm@linux-foundation.org>,
 Lizhi Xu <lizhi.xu@windriver.com>
References: <0000000000000526f2060a30a085@google.com>
 <20231116031352.40853-1-lizhi.xu@windriver.com>
 <20231116134332.285510d340637171d2fe968c@linux-foundation.org>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20231116134332.285510d340637171d2fe968c@linux-foundation.org>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfC+I8QRId6duVSwXX9HS4UJ78rK3xTffbQlmrXjkCWGGGs1kSlWnxkwTTJQn9DwBWsbQyShNIK9ZeFdcXUg8m5oHAUPVAuY4c7qM9zQ7poeuO54fAYjE
 YHMigWOC5/GyEollolsHsPUkxiQPeXhFdeOQwylaS3SfEdv9ezaimmAeGP7DLu9EUF0Frm2n1DF2v/hKFCA2R72U9jHUsstYU4Z0ugJsATR7B0hB7qvGemdb
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 16/11/2023 21:43, Andrew Morton wrote: > On Thu, 16 Nov
 2023 11:13:52 +0800 Lizhi Xu <lizhi.xu@windriver.com> wrote: > >> when the
 length passed in is 0, the subsequent process should be exited. > [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [216.69.139.18 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [216.69.139.18 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.2 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1r3oQa-007wpL-Aw
Subject: Re: [Squashfs-devel] [PATCH] squashfs: squashfs_read_data need to
 check if the length is 0
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
Cc: linux-fsdevel@vger.kernel.org, squashfs-devel@lists.sourceforge.net,
 syzbot+32d3767580a1ea339a81@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 16/11/2023 21:43, Andrew Morton wrote:
> On Thu, 16 Nov 2023 11:13:52 +0800 Lizhi Xu <lizhi.xu@windriver.com> wrote:
> 
>> when the length passed in is 0, the subsequent process should be exited.
> 
> Thanks, but when fixing a bug, please always describe the runtime
> effects of that bug.  Amongst other things, other people need this
> information to be able to decide which kernel versions need patching.
> 
>> Reported-by: syzbot+32d3767580a1ea339a81@syzkaller.appspotmail.com
> 
> Which is a reason why we're now adding the "Closes:" tag after
> Reported-by:.

Which is also one reason why you should always run scripts/checkpatch.pl
on your patch.  This alerted me to the need for a "Closes:" tag
after Reported-by: on the last patch I sent.

> 
> I googled the sysbot email address and so added
> 
> Closes: https://lkml.kernel.org/r/0000000000000526f2060a30a085@google.com
> 
> to the changelog.

Thanks.  That is indeed the sysbot issue that the patch fixes.

> 
> I'll assume that a -stable kernel backport is needed.
> 
> 

Yes.

Phillip



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
