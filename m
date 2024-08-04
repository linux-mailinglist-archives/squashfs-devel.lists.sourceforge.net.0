Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B99470B8
	for <lists+squashfs-devel@lfdr.de>; Sun,  4 Aug 2024 23:35:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1saiss-0000SX-Vg;
	Sun, 04 Aug 2024 21:35:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <phillip@squashfs.org.uk>) id 1saiss-0000SP-Cj
 for squashfs-devel@lists.sourceforge.net;
 Sun, 04 Aug 2024 21:35:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+0owKh4fQDEeQ37nH+OdwJvNzazvuRV9mnYka8l8kwk=; b=HTpd++K0pN/US599zfkYtLXNk8
 IXXweeM1L8yaI1VOTld7X5BI5/0yzf9/wyXAcmBPWKnvx6q2MYD+XUlVkMIB32jRj0zoX55T8K2ui
 gEtL0xukfLns/KD1915QDK+GZ35CMW8408e0DpJf+pwm+hW4KQy9wZL71pvn4EOZsgkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+0owKh4fQDEeQ37nH+OdwJvNzazvuRV9mnYka8l8kwk=; b=l7FmfeVl0SsP1zw6xUs4SiSECc
 XFnicpwfmS4C1+TNMTSbGHS+FRtXEJmZHoOKSMMgHT3Q7nd6+KyTzwGhOVjKbqn/kUkoWiybKTEpF
 Pme2fqSSnm1A7R8H0G1heDFlzE1a0YDqkBy6N4oB3iUe1gm1GiDDE5qatQYuU1YGGC0A=;
Received: from sxb1plsmtpa01-01.prod.sxb1.secureserver.net ([188.121.53.2])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1saisr-0004lC-Ex for squashfs-devel@lists.sourceforge.net;
 Sun, 04 Aug 2024 21:35:22 +0000
Received: from [192.168.178.90] ([82.69.79.175]) by :SMTPAUTH: with ESMTPA
 id aiaIsPLtwT7r3aiaJs6CIe; Sun, 04 Aug 2024 14:16:12 -0700
X-CMAE-Analysis: v=2.4 cv=eKHYj2p1 c=1 sm=1 tr=0 ts=66afef9c
 a=84ok6UeoqCVsigPHarzEiQ==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=IkcTkHD0fZMA:10 a=hSkVLCK3AAAA:8 a=edf1wS77AAAA:8 a=t7CeM3EgAAAA:8
 a=AYFBRnY8-RZy9VRH-ocA:9 a=QEXdDO2ut3YA:10 a=cQPPKAXgyycSBL8etih5:22
 a=DcSpbTIhAlouE1Uv7lRv:22 a=FdTzh2GWekK77mhwV6Dw:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk
Message-ID: <ee839d00-fd42-4b69-951d-8571140c077b@squashfs.org.uk>
Date: Sun, 4 Aug 2024 22:16:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Lizhi Xu <lizhi.xu@windriver.com>
References: <20240803040729.1677477-1-lizhi.xu@windriver.com>
 <20240803074349.3599957-1-lizhi.xu@windriver.com>
Content-Language: en-GB
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <20240803074349.3599957-1-lizhi.xu@windriver.com>
X-CMAE-Envelope: MS4xfDB39zMuKKKGl0cRk055VM/7sOXB+HnqoLITDfM9xE1xUANA6G3b+/JvI6+zDqGRPd1eI5bq9/MMC4F4Dk/xP7JnyEusxHloHYR5RmJW9zaAsQJeDgpN
 OF9+z5yVJj+JgI6ScB2c0DUAreC8dcrHP8KCtDuWs4RlbRDZwOu+n8+AdFKt4bSLwgrRVk/Ag1uxnLH1dWgXUn54l+2GqXF+kqLjvq5sItCEC5CMuiLgusaO
 k+V9In1ctMh+9k+wE0e2/9meKkNuPR/nhDptnb1pAogFplkMC4Bd+yuGJFrmZTOtNTvEm9kX5oi8Alfuo4WzeIsZajSHSMpLo5eJbfoCa72qtwxUrPr944Cg
 Ys02USnup0N/Yy+cUgGUKolQ0EwWUf6JnMgyKb2WebFP4NcTES+hz2wvoDzFEYVirLz6nqeMeIwlf4xKV8DYVbPg/fcT+ob8rgBGInNrCza5OCS+Q8fdvDmm
 UfeIlDrGrvwivP1+AyubIg7lu1Sa3XA2TIDvWxdAGhoCmkF6hf/DxKaK1J3E3itweHuVdK03QvxBuQ13
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/08/2024 08:43, Lizhi Xu wrote: > syzbot report KMSAN:
 uninit-value in pick_link, the root cause is that > squashfs_symlink_read_folio
 did not check the length, resulting in folio > not being ini [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.2 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [188.121.53.2 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [188.121.53.2 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1saisr-0004lC-Ex
Subject: Re: [Squashfs-devel] [PATCH V7] squashfs: Add symlink size check in
 squash_read_inode
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
Cc: squashfs-devel@lists.sourceforge.net, brauner@kernel.org, jack@suse.cz,
 syzbot+24ac24ff58dc5b0d26b9@syzkaller.appspotmail.com,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

On 03/08/2024 08:43, Lizhi Xu wrote:
> syzbot report KMSAN: uninit-value in pick_link, the root cause is that
> squashfs_symlink_read_folio did not check the length, resulting in folio
> not being initialized and did not return the corresponding error code.
> 
> The length is calculated from i_size, this case is about symlink, so i_size
> value is derived from symlink_size, so it is necessary to add a check to
> confirm that symlink_size value is valid, otherwise an error -EINVAL will
> be returned.
> 
> If symlink_size is too large, it may result in a negative value when
> calculating length in squashfs_symlink_read_folio due to int overflow,
> and its value must be greater than PAGE_SIZE at this time.
> 
> Reported-and-tested-by: syzbot+24ac24ff58dc5b0d26b9@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=24ac24ff58dc5b0d26b9
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>   fs/squashfs/inode.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/inode.c b/fs/squashfs/inode.c
> index 16bd693d0b3a..bed6764e4461 100644
> --- a/fs/squashfs/inode.c
> +++ b/fs/squashfs/inode.c
> @@ -273,14 +273,21 @@ int squashfs_read_inode(struct inode *inode, long long ino)
>   	case SQUASHFS_SYMLINK_TYPE:
>   	case SQUASHFS_LSYMLINK_TYPE: {
>   		struct squashfs_symlink_inode *sqsh_ino = &squashfs_ino.symlink;
> +		loff_t symlink_size;
>   
>   		err = squashfs_read_metadata(sb, sqsh_ino, &block, &offset,
>   				sizeof(*sqsh_ino));
>   		if (err < 0)
>   			goto failed_read;
>   
> +		symlink_size = le32_to_cpu(sqsh_ino->symlink_size);
> +		if (symlink_size > PAGE_SIZE) {
> +			ERROR("Corrupted symlink, size [%llu]\n", symlink_size);
> +			return -EINVAL;
> +		}
> +
>   		set_nlink(inode, le32_to_cpu(sqsh_ino->nlink));
> -		inode->i_size = le32_to_cpu(sqsh_ino->symlink_size);
> +		inode->i_size = symlink_size;

NACK. I see no reason to introduce an intermediate variable here.

Please do what Al Viro suggested.

Thanks

Phillip Lougher
--
Squashfs author and maintainer

BTW I have been on vacation since last week, and only saw
this today.

>   		inode->i_op = &squashfs_symlink_inode_ops;
>   		inode_nohighmem(inode);
>   		inode->i_data.a_ops = &squashfs_symlink_aops;



_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel
