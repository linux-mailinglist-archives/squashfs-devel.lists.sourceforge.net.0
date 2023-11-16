Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F243E7EE4EF
	for <lists+squashfs-devel@lfdr.de>; Thu, 16 Nov 2023 17:07:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1r3eu1-0003uf-Uu;
	Thu, 16 Nov 2023 16:07:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1r3etz-0003uZ-T1
 for squashfs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 16:07:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XBM74Djz/iWDiFs0G/4wDaa7RLTernm/uN0rNKSdg8s=; b=ivliNV/RheUmmtx/k3jflf/1Bd
 WCMcizRChgmdvTnXrDJtiumvNjTyPNrSdW4QXsgfPc2u+AKsqq0xN9IWCUbSYFZE423TOS1ZXvrgt
 FzlsHqKyrMvWNtwKYmG7z8rnbw7gdpow4+/CdKvwTyerZ+NzcUx1drQoySiOEG6ALISo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:References:
 In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XBM74Djz/iWDiFs0G/4wDaa7RLTernm/uN0rNKSdg8s=; b=I6BvaXM4kqZD1Z+SE+2HSYaSLp
 lUuY/HRU8phqb6hTO2fFThAygzYgeEFpAqclo4Lo7zL1jPhklXFCFms8Xtu8YZgyF/higiecn15Iz
 nHsv4TFlZ8lJbyh96iSN+ejk1uG4iTSjuoi8htK6xULfhB7AyZYwwB1g35/sPoYDYZtI=;
Received: from p3plsmtp16-02-2.prod.phx3.secureserver.net ([173.201.193.56]
 helo=p3plwbeout16-02.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3etw-0001V8-5P for squashfs-devel@lists.sourceforge.net;
 Thu, 16 Nov 2023 16:07:35 +0000
X-MW-NODE: 
X-CMAE-Analysis: v=2.4 cv=SYYyytdu c=1 sm=1 tr=0 ts=655639b2
 a=dFffxkGDbYo3ckkjzRcKYg==:117 a=dFffxkGDbYo3ckkjzRcKYg==:17
 a=TT3OXX8_H1iH7GK2:21 a=ggZhUymU-5wA:10 a=IkcTkHD0fZMA:10 a=t7CeM3EgAAAA:8
 a=FXvPX3liAAAA:8 a=hSkVLCK3AAAA:8 a=hlfSdipmgW7WWFGKQN0A:9 a=QEXdDO2ut3YA:10
 a=EebzJV9D4rpJJoWO5PQE:22 a=FdTzh2GWekK77mhwV6Dw:22 a=UObqyxdv-6Yh2QiB9mM_:22
 a=cQPPKAXgyycSBL8etih5:22 a=b0R6z3OkPTeaBGj_aaBY:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
X-SID: 3eb2rPcI9GN7i
Date: Thu, 16 Nov 2023 15:47:59 +0000 (GMT)
From: Phillip Lougher <phillip@squashfs.org.uk>
To: Lizhi Xu <lizhi.xu@windriver.com>,
 syzbot+32d3767580a1ea339a81@syzkaller.appspotmail.com,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
Message-ID: <261429818.1734406.1700149679974@eu1.myprofessionalmail.com>
In-Reply-To: <20231116031352.40853-1-lizhi.xu@windriver.com>
References: <0000000000000526f2060a30a085@google.com>
 <20231116031352.40853-1-lizhi.xu@windriver.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Normal
X-Mailer: Open-Xchange Mailer v8.18.49
X-Originating-IP: 82.69.79.175
X-Originating-Client: open-xchange-appsuite
X-CMAE-Envelope: MS4xfP5dWoFg+M+ZbHqU6VfYXdfwfo2GWM4bkl/BocaMV3PJM36+tJnayLaj5N+fOY/wfJtaAqSRbDzYoK4RvQBifMSoZXLM5ZW8UGrGj7gJ4TqUNX+EXXji
 Y+x2GdNvPOiSAkVqTy/8r7vRcMjYjJMN5uSagylNF1qNQ38kzHI6WKOkvpCTlJz+j6A1tnd0qtQl7EMmrodQHNEytKXfEkiaYP3S3mGZnE77Tvp+7Kds8ORe
 JvIbZmaKwKUyt5hvGMfnvz17XtHuCFProE9plCbX6enG5Fa1Uk2NJfDJdJwjoOli6FQM19zC0ZQFeJR3/VKL0jCk7L1drGh+tLH0Uadq7+0UFh0GvewPUM+2
 gh5wtf6jf6mAbVpZw/VMmGtCBlFHZWZDp6kqOepZj977Wh1eLhZ52TB1uTboFJP0UIMT15TPmG4RV7E2SV0nzMhKHA+wsaWR5675kyeWfsaOnBXzV/EuEMX8
 gGQAGF8S3HNEg7m6n6EaNYcc6qzDTRajc9JboBEUdLnbA7r3ELq4TmqMoaNq3Ukuuwfsb0lmZvbNdXzM
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > On 16/11/2023 03:13 GMT Lizhi Xu <lizhi.xu@windriver.com>
 wrote: > > > when the length passed in is 0, the subsequent process should
 be exited. > Reproduced and tested. Reviewed-by: Phillip Lougher
 (phillip@squashfs.org.uk)
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [173.201.193.56 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [173.201.193.56 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1r3etw-0001V8-5P
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
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: squashfs-devel-bounces@lists.sourceforge.net


> On 16/11/2023 03:13 GMT Lizhi Xu <lizhi.xu@windriver.com> wrote:
> 
>  
> when the length passed in is 0, the subsequent process should be exited.
> 

Reproduced and tested.

Reviewed-by: Phillip Lougher (phillip@squashfs.org.uk)

> Reported-by: syzbot+32d3767580a1ea339a81@syzkaller.appspotmail.com
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  fs/squashfs/block.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/block.c b/fs/squashfs/block.c
> index 581ce9519339..2dc730800f44 100644
> --- a/fs/squashfs/block.c
> +++ b/fs/squashfs/block.c
> @@ -321,7 +321,7 @@ int squashfs_read_data(struct super_block *sb, u64 index, int length,
>  		TRACE("Block @ 0x%llx, %scompressed size %d\n", index - 2,
>  		      compressed ? "" : "un", length);
>  	}
> -	if (length < 0 || length > output->length ||
> +	if (length <= 0 || length > output->length ||
>  			(index + length) > msblk->bytes_used) {
>  		res = -EIO;
>  		goto out;
> -- 
> 2.25.1


_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
